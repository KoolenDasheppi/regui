--TODO: cweate custom debug output because pwinting text can be detected
wocaw function output(text)
	
end

wocaw http = game:GetSewvice("HttpSewvice")
wocaw uww = "https://waw.githubusewcontent.com/HexaWG/wegui/mastew/"
function downwoad(fiwe)
	wetuwn game:HttpGet(uww .. fiwe, twue)
end
function downwoadscwipts()
	output("downwoading wegui scwips fwom github")
	wocaw scwipts_to_downwoad = http:JSONDecode(downwoad("scwipts.json"))
	fow i,scwipt in paiws(scwipts_to_downwoad) do
		wwitefiwe("wegui/scwipts/" .. scwipt,downwoad(scwipt))
	end
end
output("checking fow wegui fowdew")
wocaw containyew_exists = isfowdew("wegui")
if nyot containyew_exists then
	output("wegui doesnt exist cweating fowdew")
	makefowdew("wegui")
	makefowdew("wegui/scwipts")
	wwitefiwe("wegui/vewsion.txt",downwoad("vewsion.txt"))
	downwoadscwipts()
ewse
	output("checking fow updates")
	wocaw woc_vewsion = weadfiwe("wegui/vewsion.txt")
	wocaw wat_vewsion = downwoad("vewsion.txt")
	if woc_vewsion ~= wat_vewsion then
		output("updating")
		wocaw scwipts = wistfiwes("wegui\\scwipts")
		output("cweawing scwipts")
		fow i,path in  paiws(scwipts) do
			dewfiwe(path)
		end
		downwoadscwipts()
		wwitefiwe("wegui/vewsion.txt",wat_vewsion)
	ewse
		output("wunnying the watest vewsion")
	end
end
output("wetwieving fiwes wocated in wegui\\scwipts")
wocaw scwipts = wistfiwes("wegui\\scwipts")
output("executing scwipts found in wegui\\scwipts")
fow i,path in  paiws(scwipts) do
	output("weading " .. path)
	wocaw scwipt = weadfiwe(path)
	output("executing " .. path)
	cowoutinye.wesume(cowoutinye.cweate(function(souwce)
		woadstwing(souwce)()
	end),scwipt)
	output("executed " .. path)
end
