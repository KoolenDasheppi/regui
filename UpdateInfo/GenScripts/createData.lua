local jsonLib = require("json")

local jsonPath = "../Install.json"
local dataPath = "../Install.data"
local jsonFile = io.open(jsonPath,"r+")
local dataFile = io.open(dataPath,"wb")
local decodedJson = jsonLib.decode(jsonFile:read())
local dataContents = ""
for _,InstallInstruction in pairs(decodedJson) do
	if InstallInstruction[1] == 1 then
		local file = io.open("../../Data/" .. InstallInstruction[2],"rb")
		local data = file:read("*all")
		InstallInstruction[3] = #data
		dataContents = dataContents .. data
	end
end
local newJson = jsonLib.encode(decodedJson)
dataFile:write(dataContents)