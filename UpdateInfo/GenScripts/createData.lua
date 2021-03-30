local jsonLib = require("json")

local jsonPath = "../Install.json"
local dataPath = "../Install.data"
local jsonFileRead = io.open(jsonPath,"rb")
local dataFile = io.open(dataPath,"wb")
local decodedJson = jsonLib.decode(jsonFileRead:read())
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
local jsonFileWrite = io.open(jsonPath,"wb")
jsonFileWrite:write(newJson)