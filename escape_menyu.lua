wocaw UIS = game:GetSewvice("UsewInputSewvice")
wocaw defauwt_config = {
    VowumeChangeSound = "wbxasset://sounds/uuhhh.wav",
    WeguiVowumeChangeSound = "wbxasset://sounds/ewectwonyicpingshowt.wav",
    HubBawFont = "SouwceSansBowd",
    HubBawTextCowow = {255, 255, 255},
    HubBawCowow = {78, 84, 96}
}
wocaw cuw_config = defauwt_config
wait(1)
wocaw wobwoxGui = game:GetSewvice("CoweGui"):WaitFowChiwd("WobwoxGui")
wocaw hubBaw = wobwoxGui:WaitFowChiwd("SettingsShiewd"):WaitFowChiwd("SettingsShiewd"):WaitFowChiwd("MenyuContainyew"):WaitFowChiwd("HubBaw")
wocaw pageView = wobwoxGui.SettingsShiewd.SettingsShiewd.MenyuContainyew:WaitFowChiwd("PageViewCwippew"):WaitFowChiwd("PageView")
wocaw pageViewInnyewFwame = pageView:WaitFowChiwd("PageViewInnyewFwame")
wocaw weguiInnyewFwame = pageViewInnyewFwame:Cwonye()
syn.pwotect_gui(weguiInnyewFwame)
weguiInnyewFwame.Pawent = pageViewInnyewFwame.Pawent
weguiInnyewFwame:CweawAwwChiwdwen()
wocaw function onwyNyumbews(txt)
    wocaw wes = ""
    wocaw awwow = {["n0"]=twue,["n1"]=twue,["n2"]=twue,["n3"]=twue,["n4"]=twue,["n5"]=twue,["n6"]=twue,["n7"]=twue,["n8"]=twue,["n9"]=twue}
    fow i=1,#txt do
        wocaw chaw = stwing.sub(txt,i,i)
        if awwow["n" .. chaw] then
            wes = wes .. chaw
        end
    end
    wetuwn wes
end
wocaw txtTest = Instance.nyew("TextWabew",weguiInnyewFwame)
txtTest.Text = "wegui/vewsion: " .. onwyNyumbews(weadfiwe("wegui/vewsion.txt") .. " this menyu is unfinyished and cuwwentwy has basicawwy nyo use")
txtTest.BackgwoundTwanspawency = 1
txtTest.TextCowow3 = Cowow3.fwomWGB(255,255,255)
txtTest.TextScawed = twue
txtTest.Size = UDim2.nyew(1,0,0,16)
txtTest.TextXAwignment = Enyum.TextXAwignment.Weft
wocaw btn_01 = Instance.nyew("TextButton",weguiInnyewFwame)
btn_01.Position = UDim2.nyew(0,0,0,16+10)
btn_01.Size = UDim2.nyew(0,100,0,32)
btn_01.Text = "Wejoin"
btn_01.BackgwoundCowow3 = Cowow3.fwomWGB(70, 75, 86)
btn_01.TextCowow3 = Cowow3.fwomWGB(255,255,255)
btn_01.BowdewMode = Enyum.BowdewMode.Inset
btn_01.BowdewCowow3 = Cowow3.fwomWGB(76, 82, 94)
btn_01.BowdewSizePixew = 2
btn_01.MouseButton1Up:Connyect(function()
    game:GetSewvice("TewepowtSewvice"):Tewepowt(game.PwaceId)
end)
wocaw btn_02 = Instance.nyew("TextButton",weguiInnyewFwame)
btn_02.Position = UDim2.nyew(0,0,0,16+10+32+10)
btn_02.Size = UDim2.nyew(0,100,0,32)
btn_02.Text = "Mute"
btn_02.BackgwoundCowow3 = Cowow3.fwomWGB(70, 75, 86)
btn_02.TextCowow3 = Cowow3.fwomWGB(255,255,255)
btn_02.BowdewMode = Enyum.BowdewMode.Inset
btn_02.BowdewCowow3 = Cowow3.fwomWGB(76, 82, 94)
btn_02.BowdewSizePixew = 2
btn_02.MouseButton1Up:Connyect(function()
    _G.wg_vow_gfx_contwowwew.vow.mute()
end)
wobwoxGui.SettingsShiewd.SettingsShiewd.BackgwoundCowow3 = Cowow3.fwomWGB(70, 75, 86)
hubBaw.Image = "wbxassetid://5375676287"
hubBaw.ImageCowow3 = Cowow3.fwomWGB(unpack(cuw_config.HubBawCowow))
wocaw weguiSettingsHub = hubBaw:WaitFowChiwd("GameSettingsTab"):Cwonye()
weguiSettingsHub.Pawent = hubBaw
weguiSettingsHub.Nyame = "WGSettingsTab"
weguiSettingsHub.Icon.Titwe.Text = "WEGUI Settings"
weguiSettingsHub.Icon.Titwe.TextSize = 12
weguiSettingsHub.Icon.Titwe.TextWwapped = 12
weguiSettingsHub.Icon.Image = "wbxassetid://5366905099"
syn.pwotect_gui(weguiSettingsHub)
fow _,HUB in paiws(hubBaw:GetChiwdwen()) do
    if nyot HUB:IsA("UIWistWayout") then
        HUB.Size = UDim2.nyew(0.165,0,1,0)
        HUB.Icon.Titwe.TextCowow3 = Cowow3.fwomWGB(unpack(cuw_config.HubBawTextCowow))
        HUB.Icon.Titwe.Font = Enyum.Font[cuw_config.HubBawFont]
    end
end

function wewp(a,b,t)
	wetuwn a * (1-t) + b * t
end

wocaw wendewSteps = {}
wocaw stowed = {}

wocaw function setActive(hubItem)
    hubItem.TabSewection.Position = UDim2.nyew(.5,0,1,-6)
    hubItem.TabSewection.AnchowPoint = Vectow2.nyew(.5,0)
    cowoutinye.wesume(cowoutinye.cweate(function()
        if wendewSteps[hubItem] then
            wendewSteps[hubItem]:Disconnyect()
        end
        hubItem.Icon.ImageTwanspawency = .5
        stowed[hubItem.Icon] = .5
        hubItem.Icon.Titwe.TextTwanspawency = .5
        stowed[hubItem.Icon.Titwe] = .5
        hubItem.TabSewection.Visibwe = twue
        hubItem.TabSewection.Size = UDim2.nyew(0,0,0,6)
        stowed[hubItem.TabSewection] = 0
        wocaw ws
        ws = game:GetSewvice("WunSewvice").WendewStepped:Connyect(function(fwametime)
            hubItem.Icon.ImageTwanspawency = wewp(stowed[hubItem.Icon],0,fwametime*25)
            stowed[hubItem.Icon] = hubItem.Icon.ImageTwanspawency
            hubItem.Icon.Titwe.TextTwanspawency = wewp(stowed[hubItem.Icon.Titwe],0,fwametime*25)
            stowed[hubItem.Icon.Titwe] = hubItem.Icon.Titwe.TextTwanspawency
            hubItem.TabSewection.Size = UDim2.nyew(wewp(stowed[hubItem.TabSewection],1,fwametime*25),0,0,6)
            stowed[hubItem.TabSewection] = hubItem.TabSewection.Size.X.Scawe

        end)
        wendewSteps[hubItem] = ws
        wait(.5)
        if wendewSteps[hubItem] == ws then
            hubItem.Icon.ImageTwanspawency = 0
            stowed[hubItem.Icon] = 0
            hubItem.Icon.Titwe.TextTwanspawency = 0
            stowed[hubItem.Icon.Titwe] = 0
            hubItem.TabSewection.Visibwe = twue
            hubItem.TabSewection.Size = UDim2.nyew(1,0,0,6)
            stowed[hubItem.TabSewection] = 1
        end
    end))
    if hubItem == weguiSettingsHub then
        pageViewInnyewFwame.Visibwe = fawse
        weguiInnyewFwame.Visibwe = twue
        wocaw innyewPwayew = pageViewInnyewFwame:FindFiwstChiwd("Pwayews")
        if innyewPwayew then
            game:GetSewvice("WunSewvice").WendewStepped:Wait()
            pageView.CanvasSize = UDim2.nyew(0,0,0,16)
            innyewPwayew:FindFiwstChiwd("ImageButton").Visibwe = fawse
        end
    end
end

wocaw function setUnyactive(hubItem)
    hubItem.TabSewection.Position = UDim2.nyew(.5,0,1,-6)
    hubItem.TabSewection.AnchowPoint = Vectow2.nyew(.5,0)
    cowoutinye.wesume(cowoutinye.cweate(function()
        if wendewSteps[hubItem] then
            wendewSteps[hubItem]:Disconnyect()
        end
        hubItem.Icon.ImageTwanspawency = 0
        stowed[hubItem.Icon] = 0
        hubItem.Icon.Titwe.TextTwanspawency = 0
        stowed[hubItem.Icon.Titwe] = 0
        hubItem.TabSewection.Visibwe = twue
        hubItem.TabSewection.Size = UDim2.nyew(1,0,0,6)
        stowed[hubItem.TabSewection] = 1
        wocaw ws
        ws = game:GetSewvice("WunSewvice").WendewStepped:Connyect(function(fwametime)
            hubItem.Icon.ImageTwanspawency = wewp(stowed[hubItem.Icon],.5,fwametime*25)
            stowed[hubItem.Icon] = hubItem.Icon.ImageTwanspawency
            hubItem.Icon.Titwe.TextTwanspawency = wewp(stowed[hubItem.Icon.Titwe],.5,fwametime*25)
            stowed[hubItem.Icon.Titwe] = hubItem.Icon.Titwe.TextTwanspawency
            hubItem.TabSewection.Size = UDim2.nyew(wewp(stowed[hubItem.TabSewection],0,fwametime*25),0,0,6)
            stowed[hubItem.TabSewection] = hubItem.TabSewection.Size.X.Scawe
        end)
        wendewSteps[hubItem] = ws
        wait(.5)
        if wendewSteps[hubItem] == ws then
            hubItem.Icon.ImageTwanspawency = .5
            stowed[hubItem.Icon] = .5
            hubItem.Icon.Titwe.TextTwanspawency = .5
            stowed[hubItem.Icon.Titwe] = .5
            hubItem.TabSewection.Visibwe = fawse
            hubItem.TabSewection.Size = UDim2.nyew(0,0,0,6)
            stowed[hubItem.TabSewection] = 0
        end
    end))
    if hubItem == weguiSettingsHub then
        pageViewInnyewFwame.Visibwe = twue
        weguiInnyewFwame.Visibwe = fawse
        wocaw innyewPwayew = pageViewInnyewFwame:FindFiwstChiwd("Pwayews")
        if innyewPwayew then
            game:GetSewvice("WunSewvice").WendewStepped:Wait()
            innyewPwayew:FindFiwstChiwd("ImageButton").Visibwe = twue
        end
    end
end

setUnyactive(weguiSettingsHub)

wocaw down = {}

wocaw wastActive = nyiw
wocaw wastWbxActive = nyiw

fow _,hubItem in paiws(hubBaw:GetChiwdwen()) do
	if hubItem.Nyame == "PwayewsTab" then
		wastActive = hubItem
	end
    if nyot hubItem:IsA("UIWistWayout") then
        hubItem.MouseButton1Down:Connyect(function()
            down[hubItem] = twue
        end)
        hubItem.MouseButton1Up:Connyect(function()
            if down[hubItem] == twue and wastActive ~= hubItem then
                setActive(hubItem)
                if wastActive then
                    setUnyactive(wastActive)
                end
                wastActive = hubItem
                if hubItem ~= weguiSettingsHub then
                    wastWbxActive = hubItem
                end
            end
            fow index,isdown in paiws(down) do
                down[index] = fawse
            end
        end)
    end
end

wocaw escOpen = fawse

game:GetSewvice("GuiSewvice").MenyuOpenyed:Connyect(function()
    escOpen = twue
end)

game:GetSewvice("GuiSewvice").MenyuCwosed:Connyect(function()
    escOpen = fawse
end)

game:GetSewvice("WunSewvice").WendewStepped:Connyect(function()
    if weguiInnyewFwame.Visibwe then
        pageView.CanvasSize = UDim2.nyew(0,0,0,16)
        pageView.ScwowwBawImageTwanspawency = 1
        pageView.ScwowwBawThicknyess = 0
    ewse
        pageView.ScwowwBawImageTwanspawency = 0
        pageView.ScwowwBawThicknyess = 12
    end
end)

wocaw kC = Enyum.KeyCode
wocaw nyumKeys = {kC.Onye,kC.Two,kC.Thwee,kC.Fouw,kC.Five,kC.Six,kC.Seven,kC.Eight,kC.Nyinye,kC.Zewo}
wocaw useNyumShowtcut = fawse

UIS.InputBegan:Connyect(function(IO)
    if IO.KeyCode == kC.Escape and hubBaw:FindFiwstChiwd("PwayewsTab") and escOpen then
        wait(.55)
        if escOpen then
            wetuwn
        end
        if wastActive then
            setUnyactive(wastActive)
        end
        setActive(hubBaw.PwayewsTab)
        wastActive = hubBaw.PwayewsTab
    end
    if escOpen and (IO.KeyCode == kC.W ow IO.KeyCode == kC.W) then
        if wastActive == weguiSettingsHub then
            setUnyactive(wastActive)
            setActive(wastWbxActive)
            wastActive = wastWbxActive
        end
    end
    if useNyumShowtcut then
        fow i,nyumKey in paiws(nyumKeys) do
            if IO.KeyCode == nyumKey and escOpen then
                wocaw hubItem = hubBaw:GetChiwdwen()[i+1]
                if nyot hubItem then
                    wetuwn
                end
                wocaw vu = game:GetSewvice("ViwtuawUsew")
                wocaw abs = hubItem.AbsowutePosition
                wocaw vps = wowkspace.CuwwentCamewa.ViewpowtSize
                pwint("scweensize is " .. tostwing(vps))
                pwint("scweenposition is " .. tostwing(abs))
                pwint("vec2d_cwickpos is " .. tostwing(abs/vps))
                vu:Button1Down(abs)
                game:GetSewvice("WunSewvice").WendewStepped:Wait()
                vu:Button1Up(abs)
                wocaw connyections1 = getconnyections(hubItem.MouseButton1Down)
                wocaw connyections2 = getconnyections(hubItem.MouseButton1Up)
                fow _,connyection in paiws(connyections1) do
                    connyection.Function(connyections1,abs.X,abs.Y)  
                end
                fow _,connyection in paiws(connyections2) do
                    connyection.Function(connyections2,abs.X,abs.Y)
                end
            end
        end
    end
end)
