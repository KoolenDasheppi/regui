--//ReGui loader
local ReGui = {
	GithubUrl = "https://raw.githubusercontent.com/HexaRG/regui/rewrite";
	Directory = "ReGUI_V2";
	Helper = {};
	Update = function(self,RemoveOldDir)
		--//Check for the ReGUI_V2
		local ReGuiExists = self.Helper.Io:IsFolder(self.Directory)
		local UpdateNeeded = false
		if not ReGuiExists then
			--//Create the ReGUI_V2 directory
			self.Helper.Io:MakeFolder(self.Directory)
			--//Write LocalVersion.txt
			self.Helper.Io:Write(
				table.concat({self.Directory,"LocalVersion.txt"},"/"),
				self.Helper.Http:Get(
					table.concat({self.GithubUrl,"UpdateInfo","LatestVersion.txt"},"/")
				)
			)
		end
		local LocalVersion = self.Helper.Io:Read(
			table.concat({self.Directory,"LocalVersion.txt"},"/")
		)
		local LatestVersion = self.Helper.Http:Get(
			table.concat({self.GithubUrl,"UpdateInfo","LatestVersion.txt"},"/")
		)
		print(LocalVersion,LatestVersion)
		UpdateNeeded = (LocalVersion ~= LatestVersion) or (not ReGuiExists)
		if UpdateNeeded then
			--//Update LocalVersion.txt
			self.Helper.Io:Write(
				table.concat({self.Directory,"LocalVersion.txt"},"/"),
				LatestVersion
			)
			--//Get install instructions
			local InstallInstructions = self.Helper.Http:Get(
				table.concat({self.GithubUrl,"LocalVersion","Install.json"},"/"),
				true
			)
			if self.Helper.Io:IsFolder(table.concat({self.Directory,"Data"},"/")) then
				--//Remove old Data folder
				self.Helper.Io:DeleteFolder(table.concat({self.Directory,"Data"},"/"))
			end
			--//Create the Data directory
			self.Helper.Io:MakeFolder(table.concat({self.Directory,"Data"},"/"))
			--//Download files
			for InstructionId,IOInstruction in pairs(InstallInstructions) do
				--[[
				IOInstruction : Table
					1 : Type (Number)
						1: File
						2: Folder
					2 : Path (String)
				]]
				if IOInstruction[1] == 1 then
					self.Helper.Io:Write(
						table.concat({self.Directory,"Data",IOInstruction[2]},"/"),
						self.Helper.Http:Get(
							table.concat({self.GithubUrl,"Data",IOInstruction[2]},"/")
						)
					)
				elseif IOInstruction[1] == 2 then
					self.Helper.Io:MakeFolder(
						table.concat({self.Directory,"Data",IOInstruction[2]},"/")
					)
				end
			end
		end
	end;
	Run = function()
		loadstring(self.Helper.Io:Read(
			table.concat({self.Directory,"Data","Main.lua"},"/"),
		))()
	end;
}
--//Helpers

--//Http

local HttpService = game:GetService("HttpService")

ReGui.Helper.Http = {}

function ReGui.Helper.Http:Get(Url,AutoDecode)
	print("GET:/" .. Url)
	if not AutoDecode then
		return game:HttpGet(Url, true)
	else
		return self:JSONDecode(game:HttpGet(Url, true))
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

function ReGui.Helper.Io:MakeFolder(NewFolder)
	print("MakeFolder " .. NewFolder)
	makefolder(NewFolder)
end

function ReGui.Helper.Io:DeleteFolder(Folder)
	print("DeleteFolder " .. Folder)
	delfolder(Folder)
end

function ReGui.Helper.Io:IsFolder(Folder)
	print("IsFolder " .. Folder)
	return isfolder(Folder)
end

function ReGui.Helper.Io:Write(File,Contents)
	print("Write " .. File)
	writefile(File,Contents)
end

function ReGui.Helper.Io:Read(File)
	print("Read " .. File)
	return readfile(File)
end

getgenv()._ReGui = ReGui

ReGui:Update()

ReGui:Run()