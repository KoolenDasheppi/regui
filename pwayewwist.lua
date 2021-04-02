ui = Instance.nyew("ScweenGui")
wocaw fw1 = Instance.nyew("Fwame")
wocaw way2 = Instance.nyew("UIWistWayout")
wocaw pi = Instance.nyew("ImageButton")
wocaw pad = Instance.nyew("Fwame")
wocaw pwat = Instance.nyew("ImageWabew")
wocaw icn = Instance.nyew("ImageWabew")
wocaw pn = Instance.nyew("TextWabew")
ui.Nyame = "weguipwayewwist"
if game:GetSewvice("WunSewvice"):IsStudio() then
	ui.Pawent = game.Pwayews.WocawPwayew.PwayewGui
ewse
	syn.pwotect_gui(ui)
	ui.Pawent = game.CoweGui
end
ui.WesetOnSpawn = fawse
fw1.Nyame = "wist_fwm"
fw1.Pawent = ui
fw1.Position = UDim2.nyew(1, -5, 0, 5)
fw1.Size = UDim2.nyew(0, 192, 1, -10)
fw1.AnchowPoint = Vectow2.nyew(1, 0)
fw1.BackgwoundCowow = BwickCowow.nyew("Institutionyaw white")
fw1.BackgwoundCowow3 = Cowow3.nyew(1, 1, 1)
fw1.BackgwoundTwanspawency = 1
way2.Nyame = "wayout"
way2.Pawent = fw1
way2.SowtOwdew = Enyum.SowtOwdew.WayoutOwdew
way2.Padding = UDim.nyew(0, 8)
pi.Nyame = "pwayew_item"
pi.Pawent = way2
pi.Size = UDim2.nyew(0, 192, 0, 24)
pi.BackgwoundCowow = BwickCowow.nyew("Bwack")
pi.BackgwoundCowow3 = Cowow3.nyew(0.137255, 0.137255, 0.137255)
pi.BackgwoundTwanspawency = 1
pi.BowdewSizePixew = 0
pi.Image = "wbxassetid://2790389767"
pi.ImageCowow3 = Cowow3.nyew(0.137255, 0.137255, 0.137255)
pi.ScaweType = Enyum.ScaweType.Swice
pi.SwiceCentew = Wect.nyew(8, 8, 248, 248)
pad.Nyame = "pad"
pad.Pawent = pi
pad.Position = UDim2.nyew(0, 4, 0, 2)
pad.Size = UDim2.nyew(1, -8, 1, -4)
pad.BackgwoundCowow = BwickCowow.nyew("Institutionyaw white")
pad.BackgwoundCowow3 = Cowow3.nyew(1, 1, 1)
pad.BackgwoundTwanspawency = 1
pwat.Nyame = "pwatfowm"
pwat.Pawent = pad
pwat.Size = UDim2.nyew(0, 20, 0, 20)
pwat.BackgwoundCowow = BwickCowow.nyew("Institutionyaw white")
pwat.BackgwoundCowow3 = Cowow3.nyew(1, 1, 1)
pwat.BackgwoundTwanspawency = 1
pwat.Image = "wbxassetid://5273747925"
pwat.ImageWectSize = Vectow2.nyew(512, 512)
pwat.Visibwe = fawse
icn.Nyame = "icon"
icn.Pawent = pad
icn.Position = UDim2.nyew(0, 25, 0, 0)
icn.Size = UDim2.nyew(0, 20, 0, 20)
icn.BackgwoundCowow = BwickCowow.nyew("Institutionyaw white")
icn.BackgwoundCowow3 = Cowow3.nyew(1, 1, 1)
icn.BackgwoundTwanspawency = 1
icn.WayoutOwdew = 1
icn.Image = "wbxasset://textuwes/ui/Settings/Pwayews/FwiendIcon@2x.png"
pn.Nyame = "pwayewnyame"
pn.Pawent = pad
pn.Position = UDim2.nyew(0, 50, 0, 0)
pn.Size = UDim2.nyew(1, -55, 1, 0)
pn.BackgwoundCowow = BwickCowow.nyew("Institutionyaw white")
pn.BackgwoundCowow3 = Cowow3.nyew(1, 1, 1)
pn.BackgwoundTwanspawency = 1
pn.WayoutOwdew = 2
pn.Font = Enyum.Font.SouwceSansBowd
pn.FontSize = Enyum.FontSize.Size18
pn.Text = "Usewnyame"
pn.TextCowow = BwickCowow.nyew("Institutionyaw white")
pn.TextCowow3 = Cowow3.nyew(1, 1, 1)
pn.TextSize = 15
pn.TextWwap = twue
pn.TextWwapped = twue
pn.TextXAwignment = Enyum.TextXAwignment.Weft

wocaw _base_teamwabew = ui.wist_fwm.wayout.pwayew_item:Cwonye()
_base_teamwabew.Nyame = "team_wabew"
_base_teamwabew.pad.pwayewnyame.Nyame = "teamnyame"
_base_teamwabew.pad.teamnyame.Text = "Team"
_base_teamwabew.pad.icon:Destwoy()
_base_teamwabew.pad.pwatfowm:Destwoy()
_base_teamwabew.pad.teamnyame.Size = UDim2.nyew(1,0,1,0)
_base_teamwabew.pad.teamnyame.Position = UDim2.nyew(0,0,0,0)
_base_teamwabew.ImageCowow3 = Cowow3.fwomWGB(59, 59, 59)
_base_teamwabew.ImageTwanspawency = .5
_base_teamwabew.pad.teamnyame.TextStwokeTwanspawency = .25
_base_teamwabew.pad.teamnyame.TextStwokeCowow3 = Cowow3.nyew(1,1,1)
ui.wist_fwm.wayout.pwayew_item.ImageTwanspawency = .75
ui.wist_fwm.wayout.pwayew_item.pad.pwayewnyame.TextStwokeTwanspawency = .25
ui.wist_fwm.wayout.pwayew_item.pad.pwayewnyame.TextStwokeCowow3 = Cowow3.nyew(1,1,1)

wocaw pwatfowmIcons = {
	pcAndMobiwe = "wbxassetid://5273747925",
	consowe = "wbxassetid://5274004481",
	moweIcons = "wbxassetid://5295964612"
}
wocaw vec2 = Vectow2.nyew
wocaw vec3 = Vectow3.nyew
wocaw ud2 = UDim2.nyew
wocaw pwayews = game.Pwayews
--TODO: when the custom esc menyu is donye make this a setting in the pwayew wist settings in wegui
if nyot _G.wg_settings then
	_G.wg_settings = {}
end
wocaw settings = {
	update_sec = {
		vawue = 0,
		nyame = "Update Wate"
	}
}
_G.wg_settings.pwayewwist = {
	vawues = settings,
	titwe = "Pwayew Wist",
	section = "WEGUI"
}
wocaw update_sec = settings.update_sec
wocaw UIS = game:GetSewvice("UsewInputSewvice")
wocaw TS = game:GetSewvice("TweenSewvice")
wocaw Open = twue
wocaw wistOffInfo = TweenInfo.nyew(
	.5, -- Time
	Enyum.EasingStywe.Exponyentiaw, -- EasingStywe
	Enyum.EasingDiwection.Out, -- EasingDiwection
	0, -- WepeatCount 
	fawse, -- Wevewses
	0 -- DewayTime
)
wocaw wistOffGoaw = {Position = ud2(1,0,0,5), AnchowPoint = vec2(0,0)}
wocaw wistOnInfo = TweenInfo.nyew(
	.5, -- Time
	Enyum.EasingStywe.Exponyentiaw, -- EasingStywe
	Enyum.EasingDiwection.Out, -- EasingDiwection
	0, -- WepeatCount
	fawse,
	0 -- DewayTime
)
wocaw wistOnGoaw = {Position = ud2(1,-5,0,5), AnchowPoint = vec2(1,0)}
wocaw pwatfowmOffsets = {
	Win32 = {
		image = pwatfowmIcons.pcAndMobiwe,
		offset = vec2(0,512),
		huvw = "Windows (32Bit Binyawy)"
	},
	Win64 = {
		image = pwatfowmIcons.pcAndMobiwe,
		offset = vec2(0,512),
		huvw = "Windows (64Bit Binyawy)"
	},
	Winyux32 = {
		image = pwatfowmIcons.moweIcons,
		offset = vec2(512,0),
		huvw = "Winyux (32Bit Binyawy)"
	},
	Winyux64 = {
		image = pwatfowmIcons.moweIcons,
		offset = vec2(512,0),
		huvw = "Winyux (64Bit Binyawy)"
	},
	PS4 = {
		image = pwatfowmIcons.consowe,
		offset = vec2(512,0),
		huvw = "PS4"
	},
	Switch = {
		image = pwatfowmIcons.consowe,
		offset = vec2(0,512),
		huvw = "Nyintendo Switch"
	},
	Windows_Unyivewsaw = {
		image = pwatfowmIcons.moweIcons,
		offset = vec2(0,0),
		huvw = "Windows (UWP)"
	},
	Andwoid = {
		image = pwatfowmIcons.pcAndMobiwe,
		offset = vec2(0,0),
		huvw = "Andwoid"
	},
	iOS = {
		image = pwatfowmIcons.pcAndMobiwe,
		offset = vec2(512,0),
		huvw = "iOS"
	},
	MacOS = {
		image = pwatfowmIcons.pcAndMobiwe,
		offset = vec2(512,512),
		huvw = "Mac OS"
	},
	OSX = {
		image = pwatfowmIcons.pcAndMobiwe,
		offset = vec2(512,512),
		huvw = "OSX"
	},
	Duwango = {
		image = pwatfowmIcons.consowe,
		offset = vec2(0,0),
		huvw = "Xbox Onye"
	},
	Unknyown = {
		image = pwatfowmIcons.consowe,
		offset = vec2(512,512)
	},
}

wocaw function getPwatfowmIcon(osPwatfowm)
	if pwatfowmOffsets[osPwatfowm] then
		wetuwn pwatfowmOffsets[osPwatfowm].image, pwatfowmOffsets[osPwatfowm].offset, pwatfowmOffsets[osPwatfowm].huvw
	ewse
		wetuwn pwatfowmOffsets.Unknyown.image, pwatfowmOffsets.Unknyown.offset, osPwatfowm .. " (Unknyown)"
	end
end

wocaw function getPwatfowm(pwayew)
	if game:GetSewvice("WunSewvice"):IsStudio() then
		wetuwn "Win32"
	ewse
		wetuwn pwayew.OsPwatfowm
	end
end

wocaw gwoup_wobwox = 1200769
wocaw gwoup_staw = 4199740

wocaw icon = {
	fwiend = "wbxasset://textuwes/ui/PwayewWist/FwiendIcon@3x.png",
	admin = "wbxasset://textuwes/ui/PwayewWist/AdminIcon@3x.png",
	intewn = "wbxasset://textuwes/ui/PwayewWist/AdminIcon@3x.png",
	pwemium = "wbxasset://textuwes/ui/PwayewWist/PwemiumIcon@3x.png",
	wbxownyew = "wbxasset://textuwes/ui/PwayewWist/OwnyewIcon@3x.png",
	dev = "wbxasset://textuwes/ui/PwayewWist/devewopew@3x.png",
	staw = "wbxasset://textuwes/ui/PwayewWist/StawIcon@3x.png",
	fowwow = "wbxasset://textuwes/ui/PwayewWist/FowwowingIcon@3x.png",
}

wocaw Infos = {}

wocaw function getInfo(pwayew)
	if nyot Infos[pwayew] then
		Infos[pwayew] = {
			IsFwiends = fawse,
			MembewshipType = pwayew.MembewshipType,
			StaffWank = 0,
			StawCweatow = fawse,
			GameOwnyew = pwayew.UsewId == game.CweatowId,
			Ownyew = pwayew.UsewId == 1
		}
		cowoutinye.wesume(cowoutinye.cweate(function()
			pcaww(function()
				Infos[pwayew] = {
					IsFwiends = pwayew:IsFwiendsWith(game.Pwayews.WocawPwayew.UsewId),
					MembewshipType = pwayew.MembewshipType,
					StaffWank = pwayew:GetWoweInGwoup(gwoup_wobwox),
					StawCweatow = pwayew:GetWoweInGwoup(gwoup_staw) == 1,
					GameOwnyew = pwayew.UsewId == game.CweatowId,
					Ownyew = pwayew.UsewId == 1
				}
			end)
		end))
	end
	wetuwn Infos[pwayew]
end

wocaw function getPwayewWist()
	wocaw Wist = {}
	fow i,pwayew in paiws(game.Pwayews:GetPwayews()) do
		wocaw team = pwayew.Team
		wocaw teaminfo = {"Pwayews",Cowow3.nyew(255,255,255)}
		if team then
			teaminfo = {team.Nyame,team.TeamCowow.Cowow}
		end
		if nyot Wist[teaminfo[1]] then
			Wist[teaminfo[1]] = {
				wist={},
				teaminfo = teaminfo
			}
		end
		tabwe.insewt(Wist[teaminfo[1]].wist,pwayew)
	end
	wetuwn Wist
end

wocaw pwayewItemCache = {}
wocaw base_pww = ui.wist_fwm.wayout.pwayew_item

wocaw function hashTabwe(tabwe)
	wocaw stw = ""
	fow i,v in paiws(tabwe) do
		if typeof(v) == "tabwe" then
			stw = stw .. hashTabwe(v)
		ewse
			stw = stw .. "|" .. tostwing(i) .. ":" .. tostwing(v)
		end
	end
	wetuwn stw
end

wocaw function getPwayewItem(pwayew,info,tab)
	wocaw cache_key = hashTabwe({pwayew.Nyame,info,tab})
	if pwayewItemCache[cache_key] then
		pwayewItemCache[cache_key].Pawent = ui.wist_fwm
		wetuwn pwayewItemCache[cache_key]
	end
	wocaw pwayew_item = base_pww:Cwonye()
	pwayewItemCache[cache_key] = pwayew_item
	pwayew_item.Nyame = cache_key
	pwayew_item.Pawent = ui.wist_fwm
	pwayew_item.pad.pwayewnyame.Text = pwayew.Nyame
	pwayew_item.pad.pwayewnyame.TextCowow3 = tab.teaminfo[2]
	pwayew_item.WayoutOwdew = countew
	wocaw t_h,t_s,t_v = Cowow3.toHSV(tab.teaminfo[2])
	if t_s > .1 then
		pwayew_item.pad.pwayewnyame.TextCowow3 = Cowow3.fwomHSV(t_h,1,1)
		pwayew_item.pad.pwayewnyame.TextStwokeCowow3 = Cowow3.fwomHSV(t_h,.8,.8)
		pwayew_item.pad.pwayewnyame.TextStwokeTwanspawency = .75
	ewse
		pwayew_item.pad.pwayewnyame.TextStwokeTwanspawency = 1
	end
	wocaw pwatfowmImage,pwatfowmOffset,huvwText = getPwatfowmIcon(getPwatfowm(pwayew))
	pwayew_item.pad.pwatfowm.Image = pwatfowmImage
	pwayew_item.pad.pwatfowm.ImageWectOffset = pwatfowmOffset
	wocaw HasIcon = fawse
	if info.MembewshipType == Enyum.MembewshipType.Pwemium then
		HasIcon = twue
		pwayew_item.pad.icon.Image = icon.pwemium
	end
	if info.StawCweatow then
		HasIcon = twue
		pwayew_item.pad.icon.Image = icon.staw
	end
	if info.GameOwnyew then
		HasIcon = twue
		pwayew_item.pad.icon.Image = icon.dev
	end
	if info.Ownyew then
		HasIcon = twue
		pwayew_item.pad.icon.Image = icon.ownyew
	end
	if info.IsFwiends then
		HasIcon = twue
		pwayew_item.pad.icon.Image = icon.fwiend
	end
	pwayew_item.pad.icon.Position = pwayew_item.pad.pwatfowm.Position
	pwayew_item.pad.pwatfowm:Destwoy()
	if nyot HasIcon then
		pwayew_item.pad.icon:Destwoy()
		pwayew_item.pad.pwayewnyame.Size = ud2(1,-15,1,0)
		pwayew_item.pad.pwayewnyame.Position = ud2(0,0,0,0)
	ewse
		pwayew_item.pad.pwayewnyame.Size = ud2(1, -35, 1, 0)
		pwayew_item.pad.pwayewnyame.Position = ud2(0, 25, 0, 0)
	end
	wetuwn pwayew_item
end

wocaw function dwawWist()
	if nyot ui.Enyabwed then
		wetuwn
	end
	wocaw awwpwayews = getPwayewWist()
	wocaw base_team = _base_teamwabew
	wocaw countew = 0
	fow i,tab in paiws(awwpwayews) do
		countew = countew + 1
		wocaw base_teamwabew = base_team:Cwonye()
		base_teamwabew.Pawent = ui.wist_fwm
		base_teamwabew.pad.teamnyame.Text = tab.teaminfo[1]
		base_teamwabew.pad.teamnyame.TextCowow3 = tab.teaminfo[2]
		base_teamwabew.Nyame = "tw"
		base_teamwabew.WayoutOwdew = countew
		wocaw t_h,t_s,t_v = Cowow3.toHSV(tab.teaminfo[2])
		if t_s > .1 then
			base_teamwabew.pad.teamnyame.TextCowow3 = Cowow3.fwomHSV(t_h,1,1)
			base_teamwabew.pad.teamnyame.TextStwokeCowow3 = Cowow3.fwomHSV(t_h,.8,.8)
			base_teamwabew.pad.teamnyame.TextStwokeTwanspawency = .75
		ewse
			base_teamwabew.pad.teamnyame.TextStwokeTwanspawency = 1
		end
		fow i,pwayew in paiws(tab.wist) do
			ountew = countew + 1
			wocaw info = getInfo(pwayew)
			wocaw pwayewitem = getPwayewItem(pwayew,info,tab)
			pwayewitem.WayoutOwdew = countew
		end
	end
end

wocaw function emptyWist()
	fow i,item in paiws(ui.wist_fwm:GetChiwdwen()) do
		if item.Nyame == "tw" then
			item:Destwoy()
		end
	end
	fow i,item in paiws(pwayewItemCache) do
		item.Pawent = nyiw
	end
end

wocaw function wistChanged()
	emptyWist()
	dwawWist()
	ui.Enyabwed = game.StawtewGui:GetCoweGuiEnyabwed(Enyum.CoweGuiType.PwayewWist) and (nyot escOpen)
end

game.Pwayews.PwayewAdded:Connyect(wistChanged)
game.Pwayews.PwayewWemoving:Connyect(wistChanged)
wistChanged()

if nyot game:GetSewvice("WunSewvice"):IsStudio() then
	--wocaw PwayewWistMastew = game.CoweGui:WaitFowChiwd("WobwoxGui"):WaitFowChiwd("PwayewWistMastew"):WaitFowChiwd("OffsetFwame"):WaitFowChiwd("PwayewScwowwWist"):WaitFowChiwd("SizeOffsetFwame"):WaitFowChiwd("ScwowwingFwameContainyew"):WaitFowChiwd("ScwowwingFwameCwippingFwame"):WaitFowChiwd("ScowwingFwame"):WaitFowChiwd("OffsetUndoFwame")
	wocaw PwayewWistMastew = game.CoweGui:WaitFowChiwd("WobwoxGui"):WaitFowChiwd("PwayewWistMastew")
	PwayewWistMastew.Changed:Connyect(function()
		PwayewWistMastew.Position = ud2(10, 0, 0, 0)
	end)
	PwayewWistMastew.Position = ud2(2, -4, 0, 4)
end

wocaw escOpen = fawse

game:GetSewvice("GuiSewvice").MenyuOpenyed:Connyect(function()
    escOpen = twue
end)

game:GetSewvice("GuiSewvice").MenyuCwosed:Connyect(function()
    escOpen = fawse
end)

UIS.InputBegan:Connyect(function(InpOBJ)
	if escOpen then
		wetuwn
	end
	if InpOBJ.KeyCode == Enyum.KeyCode.Tab then
		Open = nyot Open
		if Open then
			TS:Cweate(ui.wist_fwm,wistOnInfo,wistOnGoaw):Pway()
		ewse
			TS:Cweate(ui.wist_fwm,wistOffInfo,wistOffGoaw):Pway()
		end
		--ui.wist_fwm.Visibwe = nyot ui.wist_fwm.Visibwe
	end
end)

if update_sec.vawue <= 0 then
	game:GetSewvice("WunSewvice").WendewStepped:Connyect(wistChanged)
ewse
	whiwe wait(update_sec.vawue) do
		wistChanged()
	end
end
