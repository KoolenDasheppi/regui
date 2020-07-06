local http = game:GetService("HttpService")
local url = "https://raw.githubusercontent.com/HexaRG/regui/master/"
function download(file)
	return game:HttpGet(url .. file)
end
function downloadscripts()
	print("downloading regui scrips from github")
	local scripts_to_download = http:JSONDecode(download("scripts.json"))
	for i,script in pairs(scripts_to_download) do
		writefile("regui/scripts/" .. script,download(script))
	end
end
print("checking for regui folder")
local container_exists = isfolder("regui")
if not container_exists then
	print("regui doesnt exist creating folder")
	makefolder("regui")
	makefolder("regui/scripts")
	writefile("regui/version.txt",download("version.txt"))
	downloadscripts()
else
	print("checking for updates")
	local loc_version = readfile("regui/version.txt")
	local lat_version = download("version.txt")
	if loc_version ~= lat_version then
		print("updating")
		local scripts = listfiles("regui\\scripts")
		print("clearing scripts")
		for i,path in  pairs(scripts) do
			delfile(path)
		end
		downloadscripts()
		writefile("regui/version.txt",lat_version)
	end
end
print("retrieving files located in regui\\scripts")
local scripts = listfiles("regui\\scripts")
print("executing scripts found in regui\\scripts")
for i,path in  pairs(scripts) do
	print("reading " .. path)
	local script = readfile(path)
	print("executing " .. path)
	loadstring(script)()
	print("executed " .. path)
end