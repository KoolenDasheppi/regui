--TODO: create custom debug output because printing text can be detected
local function output(text)
	
end

local http = game:GetService("HttpService")
local url = "https://raw.githubusercontent.com/HexaRG/regui/master/"
function download(file)
	return game:HttpGet(url .. file, true)
end
function downloadscripts()
	output("downloading regui scrips from github")
	local scripts_to_download = http:JSONDecode(download("scripts.json"))
	for i,script in pairs(scripts_to_download) do
		writefile("regui/scripts/" .. script,download(script))
	end
end
output("checking for regui folder")
local container_exists = isfolder("regui")
if not container_exists then
	output("regui doesnt exist creating folder")
	makefolder("regui")
	makefolder("regui/scripts")
	writefile("regui/version.txt",download("version.txt"))
	downloadscripts()
else
	output("checking for updates")
	local loc_version = readfile("regui/version.txt")
	local lat_version = download("version.txt")
	if loc_version ~= lat_version then
		output("updating")
		local scripts = listfiles("regui\\scripts")
		output("clearing scripts")
		for i,path in  pairs(scripts) do
			delfile(path)
		end
		downloadscripts()
		writefile("regui/version.txt",lat_version)
	else
		output("running the latest version")
	end
end
output("retrieving files located in regui\\scripts")
local scripts = listfiles("regui\\scripts")
output("executing scripts found in regui\\scripts")
for i,path in  pairs(scripts) do
	output("reading " .. path)
	local script = readfile(path)
	output("executing " .. path)
	coroutine.resume(coroutine.create(function(source)
		loadstring(source)()
	end),script)
	output("executed " .. path)
end
