--//ReGui loader
local ReGui = {
	GithubUrl = "https://raw.githubusercontent.com/HexaRG/regui/rewrite";
	Directory = "ReGUI_V2";
	Helper = {};
	Log = function(self,...)
		if _G.RGDebug then
			print(...)
		end
	end;
	Update = function(self,RemoveOldDir)
		--//Check for the ReGUI_V2
		local ReGuiExists = self.Helper.Io:IsFolder(self.Directory)
		local UpdateNeeded = false
		local Path = self.Helper.Path
		if not ReGuiExists then
			--//Create the ReGUI_V2 directory
			self.Helper.Io:MakeFolder(self.Directory)
			--//Write LocalVersion.txt
			self.Helper.Io:Write(
				Path:Join(self.Directory,"LocalVersion.txt"),
				self.Helper.Http:Get(
					Path:Join(self.GithubUrl,"UpdateInfo","LatestVersion.txt")
				)
			)
		end
		local LocalVersion = self.Helper.Io:Read(
			Path:Join(self.Directory,"LocalVersion.txt")
		)
		local LatestVersion = self.Helper.Http:Get(
			Path:Join(self.GithubUrl,"UpdateInfo","LatestVersion.txt")
		)
		self:Log(LocalVersion,LatestVersion)
		UpdateNeeded = (LocalVersion ~= LatestVersion) or (not ReGuiExists)
		if UpdateNeeded then
			--//Update LocalVersion.txt
			self.Helper.Io:Write(
				Path:Join(self.Directory,"LocalVersion.txt"),
				LatestVersion
			)
			--//Get install instructions
			local InstallInstructions = self.Helper.Http:Get(
				Path:Join(self.GithubUrl,"UpdateInfo","Install.json"),
				true
			)
			if self.Helper.Io:IsFolder(Path:Join(self.Directory,"Data")) then
				--//Remove old Data folder
				self.Helper.Io:DeleteFolder(Path:Join(self.Directory,"Data"))
			end
			--//Create the Data directory
			self.Helper.Io:MakeFolder(Path:Join(self.Directory,"Data"))
			--//Download files
			local CompletedInstructions = 0
			for InstructionId,IOInstruction in pairs(InstallInstructions) do
				--[[
				IOInstruction : Table
					1 : Type (Number)
						1: File
						2: Folder
					2 : Path (String)
				]]
				if IOInstruction[1] == 1 then
					coroutine.resume(coroutine.create(function()
						self.Helper.Io:Write(
							Path:Join(self.Directory,"Data",IOInstruction[2]),
							self.Helper.Http:Get(
								Path:Join(self.GithubUrl,"Data",IOInstruction[2])
							)
						)
						CompletedInstructions += 1
					end))
					wait()
				elseif IOInstruction[1] == 2 then
					self.Helper.Io:MakeFolder(
						Path:Join(self.Directory,"Data",IOInstruction[2])
					)
					CompletedInstructions += 1
				end
			end
			repeat game:GetService("RunService").RenderStepped:Wait() until CompletedInstructions == #InstallInstructions
		end
	end;
	Run = function(self)
		--[[loadstring(self.Helper.Io:Read(
			self.Helper.Path:Join(self.Directory,"Data","Main.lua")
		))()]]
		self.Helper:Require(self.Helper.Path:Join(self.Directory,"Data"),"Main.lua")
	end;
}
--//Helpers

--//Http

local HttpService = game:GetService("HttpService")

ReGui.Helper.Http = {}

function ReGui.Helper.Http:Get(Url,AutoDecode)
	local Response
	if not syn then
		ReGui:Log("GET:/" .. Url)
		Response = game:HttpGet(Url, true)
	else
		ReGui:Log("GET:/" .. Url)
		Response = syn.request{
			Url = Url,
			Method = "GET",
		}
		ReGui:Log(Response.StatusCode,Response.StatusMessage)
		Response = Response.Body
	end
	if not AutoDecode then
		return Response
	else
		return self:JSONDecode(Response)
	end
end

function ReGui.Helper.Http:JSONDecode(JSON)
	return HttpService:JSONDecode(JSON)
end

function ReGui.Helper.Http:JSONEncode(Table)
	return HttpService:JSONEncode(Table)
end

--//Io

ReGui.Helper.Io = {}

function ReGui.Helper.Io:ListFiles(Path)
	ReGui:Log("List " .. Path)
	return listfiles(Path)
end

function ReGui.Helper.Io:MakeFolder(NewFolder)
	ReGui:Log("MakeFolder " .. NewFolder)
	makefolder(NewFolder)
end

function ReGui.Helper.Io:DeleteFolder(Folder)
	ReGui:Log("DeleteFolder " .. Folder)
	delfolder(Folder)
end

function ReGui.Helper.Io:IsFolder(Folder)
	ReGui:Log("IsFolder " .. Folder)
	return isfolder(Folder)
end

function ReGui.Helper.Io:Read(File)
	ReGui:Log("Read " .. File)
	return readfile(File)
end

function ReGui.Helper.Io:Write(File,Contents)
	ReGui:Log("Write " .. File)
	writefile(File,Contents)
end

function ReGui.Helper.Io:Delete(File)
	ReGui:Log("Delete " .. File)
	delfile(File)
end

function ReGui.Helper.Io:IsFile(File)
	ReGui:Log("IsFile " .. File)
	return isfile(File)
end


--//Asset

ReGui.Helper.Asset = {}

function ReGui.Helper.Asset:Get(Path)
	--Automatically removes "../" using string.gsub magic (that took me longer to figure how to use than it should of) as it is unsupported when using getsynasset
	Path = Path:gsub("/%a+/%.%./","/"):gsub("\\","/")
	ReGui:Log("GetAsset " .. Path)
	if not syn then
		return "rbxasset://textures/meshPartFallback.png"
	else
		return getsynasset(Path)
	end
end

function ReGui.Helper.Asset:Insert(Path)
	--Automatically removes "../" using string.gsub magic (that took me longer to figure how to use than it should of) as it is unsupported when using getsynasset
	Path = Path:gsub("/%a+/%.%./","/"):gsub("\\","/")
	ReGui:Log("Insert " .. Path)
	return game:GetObjects(ReGui.Helper.Asset:Get(Path))
end

--//Path

ReGui.Helper.Path = {}

function ReGui.Helper.Path:Join(...)
	local Vars = {...}
	local Path = table.concat(Vars,"/"):gsub("/%a+/%.%./","/"):gsub("\\","/")
	return Path
end

--//RG Require

function ReGui.Helper:Require(ModulePath,ModuleName)
	local LoadedString = loadstring(ReGui.Helper.Io:Read(ReGui.Helper.Path:Join(ModulePath,ModuleName)))
	if not LoadedString then
		ReGui:Log(ReGui.Helper.Path:Join(ModulePath,ModuleName),"failed to load")
	end
	local OutputModule = LoadedString()(ModulePath)
	return OutputModule
end

getgenv()._ReGui = ReGui

ReGui:Update()
ReGui:Run()