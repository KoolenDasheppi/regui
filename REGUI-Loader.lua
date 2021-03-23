--//ReGui loader
local ReGui = {
	GithubUrl = "https://raw.githubusercontent.com/HexaRG/regui/rewrite/";
	Directory = "ReGUI_V2"
	Helper = {}
	Update = function(self,RemoveOldDir)
		self.Helper:MakeFolder
		--//Check for the ReGUI_V2
		local ReGuiExists = isfolder(ReGui.Directory)
		if not ReGuiExists then
			--//Create the ReGUI_V2 directory
			self.Helper.Io:MakeFolder(ReGui.Directory)
			--//Create the Data directory
			self.Helper.Io:MakeFolder(table.concat({ReGui.Directory,"Data"},"/"))
			--//Write LocalVersion.txt
			self.Helper.Io:Write(
				table.concat({ReGui.Directory,"LocalVersion.txt"},"/"),
				self.Helper.Http:Get(
					table.concat({ReGui.GithubUrl,"Data","LatestVersion.txt"},"/")
				)
			)
		end
		local LocalVersion = self.Helper.Io:Read(
			table.concat({ReGui.Directory,"LocalVersion.txt"},"/")
		)
		local LatestVersion = self.Helper.Http:Get(
			table.concat({ReGui.GithubUrl,"Data","LatestVersion.txt"},"/")
		)
		if LocalVersion ~= LatestVersion then
			--//Update LocalVersion.txt
			self.Helper.Io:Write(
				table.concat({ReGui.Directory,"LocalVersion.txt"},"/"),
				LatestVersion
			)
			--//Get install instructions
			local InstallInstructions = self.Helper.Http:Get(
				table.concat({ReGui.GithubUrl,"Data","Install.json"},"/"),
				true
			)
			--//Remove old Data folder
			self.Helper.Io:DeleteFolder(table.concat({ReGui.GithubUrl,"Data"})
			--//Download files
			for InstructionId,IOInstruction in pairs(InstallInstructions) do
				--[[
				IOInstruction : Table
					1 : Type (Number)
						1: File
						2: Folder
					2 : Path (String)
				]]
				if IOInstruction[1] = 1 then
					self.Helper.Io:Write(
						table.concat({ReGui.GithubUrl,IOInstruction[2]},"/"),
						self.Helper.Http:Get(
							table.concat({ReGui.GithubUrl,"Data",IOInstruction[2]},"/")
						)
					)
				elseif IOInstruction[1] = 2 then
					self.Helper.Io:MakeFolder(
						table.concat({ReGui.GithubUrl,"Data",IOInstruction[2]},"/")
					)
				end
			end
		end
	end
}
--//Helpers

--//Http

local HttpService = game:GetService("HttpService")

function ReGui.Helper.Http:Get(Url,AutoDecode)
	if not AutoDecode then
		return game:HttpGet(Url, true)
	else
		return ReGui.Helper.Http:JSONDecode(game:HttpGet(Url, true))
	end
end

function ReGui.Helper.Http:JSONDecode(JSON)
	return HttpService:JSONDecode(JSON)
end

function ReGui.Helper.Http:JSONEncode(Table)
	return HttpService:JSONEncode(Table)
end

--//Io

function ReGui.Helper.Io:MakeFolder(NewFolder)
	makefolder(NewFolder)
end
function ReGui.Helper.Io:DeleteFolder(NewFolder)
	delfolder(NewFolder)
end
function ReGui.Helper.Io:Write(File,Contents)
	writefile(File,Contents)
end
function ReGui.Helper.Io:Read(File)
	readfile(File)
end

ReGui:Update()

ReGui:Run()