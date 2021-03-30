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
				true,
			)
			local InstallData = self.Helper.Http:Get(
				Path:Join(self.GithubUrl,"UpdateInfo","Install.data"),
			)
			local DataOffset = 1
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
							string.sub(
								InstallData,
								DataOffset,
								DataOffset + IOInstruction[3]
							)
						)
						DataOffset += IOInstruction[3]
						CompletedInstructions += 1
					end))
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

function ReGui.Helper.Http:Get(Url,AutoDecode,AutoDecompress)
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
	if AutoDecompress then
		Response = ReGui.Helper.Compression:Decompress(Response)
	end
	if AutoDecode then
		print(Response)
		Response = self:JSONDecode(Response)
	end
	return Response
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

--//Compression (Source: https://devforum.roblox.com/t/text-compression/163637)

ReGui.Helper.Compression = {}

local dictionary = {}
for i = 1, 127 do
	local c = string.char(i)
	dictionary[c], dictionary[i-1] = i-1, c
end

local function copy(t)
	local new = {}
	for k, v in pairs(t) do
		new[k] = v
	end
	return new
end

local function tobase127(n)
	local value = ""
	repeat
		local remainder = n%127
		value = dictionary[remainder]..value
		n = (n - remainder)/127
	until n == 0
	return value
end

local function tobase10(value)
	local n = 0
	for i = 1, #value do
		n = n + 127^(i-1)*dictionary[value:sub(-i, -i)]
	end
	return n
end

function ReGui.Helper.Compression:Compress(text)
	local dictionary = copy(dictionary)
	local key, sequence, size = "", {}, #dictionary
	local width, spans, span = 1, {}, 0
	local function listkey(key)
		local value = tobase127(dictionary[key])
		if #value > width then
			width, span, spans[width] = #value, 0, span
		end
		sequence[#sequence+1] = ("\1"):rep(width - #value)..value
		span = span + 1
	end
	for i = 1, #text do
		local c = text:sub(i, i)
		local new = key..c
		if dictionary[new] then
			key = new
		else
			listkey(key)
			key, size = c, size+1
			dictionary[new], dictionary[size] = size, new
		end
	end
    listkey(key)
	spans[width] = span
    return table.concat(spans, ",").."|"..table.concat(sequence)
end

function ReGui.Helper.Compression:Decompress(text)
	local dictionary = copy(dictionary)
	local sequence, spans, content = {}, text:match("(.-)|(.*)")
	local groups, start = {}, 1
	for span in spans:gmatch("%d+") do
		local width = #groups+1
		groups[width] = content:sub(start, start + span*width - 1)
		start = start + span*width
	end
	local previous;
	for width = 1, #groups do
		for value in groups[width]:gmatch(('.'):rep(width)) do
			local entry = dictionary[tobase10(value)]
			if previous then
				if entry then
					sequence[#sequence+1] = entry
					dictionary[#dictionary+1] = previous..entry:sub(1, 1)
				else
					entry = previous..previous:sub(1, 1)
					sequence[#sequence+1] = entry
					dictionary[#dictionary+1] = entry
				end
			else
				sequence[1] = entry
			end
			previous = entry
		end
	end
    return table.concat(sequence)
end

getgenv()._ReGui = ReGui

ReGui:Update()
ReGui:Run()