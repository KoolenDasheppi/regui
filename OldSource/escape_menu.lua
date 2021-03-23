local UIS = game:GetService("UserInputService")
local default_config = {
    VolumeChangeSound = "rbxasset://sounds/uuhhh.wav",
    ReguiVolumeChangeSound = "rbxasset://sounds/electronicpingshort.wav",
    HubBarFont = "SourceSansBold",
    HubBarTextColor = {255, 255, 255},
    HubBarColor = {78, 84, 96}
}
local cur_config = default_config
wait(1)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local hubBar = robloxGui:WaitForChild("SettingsShield"):WaitForChild("SettingsShield"):WaitForChild("MenuContainer"):WaitForChild("HubBar")
local pageView = robloxGui.SettingsShield.SettingsShield.MenuContainer:WaitForChild("PageViewClipper"):WaitForChild("PageView")
local pageViewInnerFrame = pageView:WaitForChild("PageViewInnerFrame")
local reguiInnerFrame = pageViewInnerFrame:Clone()
syn.protect_gui(reguiInnerFrame)
reguiInnerFrame.Parent = pageViewInnerFrame.Parent
reguiInnerFrame:ClearAllChildren()
local function onlyNumbers(txt)
    local res = ""
    local allow = {["n0"]=true,["n1"]=true,["n2"]=true,["n3"]=true,["n4"]=true,["n5"]=true,["n6"]=true,["n7"]=true,["n8"]=true,["n9"]=true}
    for i=1,#txt do
        local char = string.sub(txt,i,i)
        if allow["n" .. char] then
            res = res .. char
        end
    end
    return res
end
local txtTest = Instance.new("TextLabel",reguiInnerFrame)
txtTest.Text = "regui/version: " .. onlyNumbers(readfile("regui/version.txt") .. " this menu is unfinished and currently has basically no use")
txtTest.BackgroundTransparency = 1
txtTest.TextColor3 = Color3.fromRGB(255,255,255)
txtTest.TextScaled = true
txtTest.Size = UDim2.new(1,0,0,16)
txtTest.TextXAlignment = Enum.TextXAlignment.Left
local btn_01 = Instance.new("TextButton",reguiInnerFrame)
btn_01.Position = UDim2.new(0,0,0,16+10)
btn_01.Size = UDim2.new(0,100,0,32)
btn_01.Text = "Rejoin"
btn_01.BackgroundColor3 = Color3.fromRGB(70, 75, 86)
btn_01.TextColor3 = Color3.fromRGB(255,255,255)
btn_01.BorderMode = Enum.BorderMode.Inset
btn_01.BorderColor3 = Color3.fromRGB(76, 82, 94)
btn_01.BorderSizePixel = 2
btn_01.MouseButton1Up:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
local btn_02 = Instance.new("TextButton",reguiInnerFrame)
btn_02.Position = UDim2.new(0,0,0,16+10+32+10)
btn_02.Size = UDim2.new(0,100,0,32)
btn_02.Text = "Mute"
btn_02.BackgroundColor3 = Color3.fromRGB(70, 75, 86)
btn_02.TextColor3 = Color3.fromRGB(255,255,255)
btn_02.BorderMode = Enum.BorderMode.Inset
btn_02.BorderColor3 = Color3.fromRGB(76, 82, 94)
btn_02.BorderSizePixel = 2
btn_02.MouseButton1Up:Connect(function()
    _G.rg_vol_gfx_controller.vol.mute()
end)
robloxGui.SettingsShield.SettingsShield.BackgroundColor3 = Color3.fromRGB(70, 75, 86)
hubBar.Image = "rbxassetid://5375676287"
hubBar.ImageColor3 = Color3.fromRGB(unpack(cur_config.HubBarColor))
local reguiSettingsHub = hubBar:WaitForChild("GameSettingsTab"):Clone()
reguiSettingsHub.Parent = hubBar
reguiSettingsHub.Name = "RGSettingsTab"
reguiSettingsHub.Icon.Title.Text = "REGUI Settings"
reguiSettingsHub.Icon.Title.TextSize = 12
reguiSettingsHub.Icon.Title.TextWrapped = 12
reguiSettingsHub.Icon.Image = "rbxassetid://5366905099"
syn.protect_gui(reguiSettingsHub)
for _,HUB in pairs(hubBar:GetChildren()) do
    if not HUB:IsA("UIListLayout") then
        HUB.Size = UDim2.new(0.165,0,1,0)
        HUB.Icon.Title.TextColor3 = Color3.fromRGB(unpack(cur_config.HubBarTextColor))
        HUB.Icon.Title.Font = Enum.Font[cur_config.HubBarFont]
    end
end

function lerp(a,b,t)
	return a * (1-t) + b * t
end

local renderSteps = {}
local stored = {}

local function setActive(hubItem)
    hubItem.TabSelection.Position = UDim2.new(.5,0,1,-6)
    hubItem.TabSelection.AnchorPoint = Vector2.new(.5,0)
    coroutine.resume(coroutine.create(function()
        if renderSteps[hubItem] then
            renderSteps[hubItem]:Disconnect()
        end
        hubItem.Icon.ImageTransparency = .5
        stored[hubItem.Icon] = .5
        hubItem.Icon.Title.TextTransparency = .5
        stored[hubItem.Icon.Title] = .5
        hubItem.TabSelection.Visible = true
        hubItem.TabSelection.Size = UDim2.new(0,0,0,6)
        stored[hubItem.TabSelection] = 0
        local rs
        rs = game:GetService("RunService").RenderStepped:Connect(function(frametime)
            hubItem.Icon.ImageTransparency = lerp(stored[hubItem.Icon],0,frametime*25)
            stored[hubItem.Icon] = hubItem.Icon.ImageTransparency
            hubItem.Icon.Title.TextTransparency = lerp(stored[hubItem.Icon.Title],0,frametime*25)
            stored[hubItem.Icon.Title] = hubItem.Icon.Title.TextTransparency
            hubItem.TabSelection.Size = UDim2.new(lerp(stored[hubItem.TabSelection],1,frametime*25),0,0,6)
            stored[hubItem.TabSelection] = hubItem.TabSelection.Size.X.Scale

        end)
        renderSteps[hubItem] = rs
        wait(.5)
        if renderSteps[hubItem] == rs then
            hubItem.Icon.ImageTransparency = 0
            stored[hubItem.Icon] = 0
            hubItem.Icon.Title.TextTransparency = 0
            stored[hubItem.Icon.Title] = 0
            hubItem.TabSelection.Visible = true
            hubItem.TabSelection.Size = UDim2.new(1,0,0,6)
            stored[hubItem.TabSelection] = 1
        end
    end))
    if hubItem == reguiSettingsHub then
        pageViewInnerFrame.Visible = false
        reguiInnerFrame.Visible = true
        local innerPlayer = pageViewInnerFrame:FindFirstChild("Players")
        if innerPlayer then
            game:GetService("RunService").RenderStepped:Wait()
            pageView.CanvasSize = UDim2.new(0,0,0,16)
            innerPlayer:FindFirstChild("ImageButton").Visible = false
        end
    end
end

local function setUnactive(hubItem)
    hubItem.TabSelection.Position = UDim2.new(.5,0,1,-6)
    hubItem.TabSelection.AnchorPoint = Vector2.new(.5,0)
    coroutine.resume(coroutine.create(function()
        if renderSteps[hubItem] then
            renderSteps[hubItem]:Disconnect()
        end
        hubItem.Icon.ImageTransparency = 0
        stored[hubItem.Icon] = 0
        hubItem.Icon.Title.TextTransparency = 0
        stored[hubItem.Icon.Title] = 0
        hubItem.TabSelection.Visible = true
        hubItem.TabSelection.Size = UDim2.new(1,0,0,6)
        stored[hubItem.TabSelection] = 1
        local rs
        rs = game:GetService("RunService").RenderStepped:Connect(function(frametime)
            hubItem.Icon.ImageTransparency = lerp(stored[hubItem.Icon],.5,frametime*25)
            stored[hubItem.Icon] = hubItem.Icon.ImageTransparency
            hubItem.Icon.Title.TextTransparency = lerp(stored[hubItem.Icon.Title],.5,frametime*25)
            stored[hubItem.Icon.Title] = hubItem.Icon.Title.TextTransparency
            hubItem.TabSelection.Size = UDim2.new(lerp(stored[hubItem.TabSelection],0,frametime*25),0,0,6)
            stored[hubItem.TabSelection] = hubItem.TabSelection.Size.X.Scale
        end)
        renderSteps[hubItem] = rs
        wait(.5)
        if renderSteps[hubItem] == rs then
            hubItem.Icon.ImageTransparency = .5
            stored[hubItem.Icon] = .5
            hubItem.Icon.Title.TextTransparency = .5
            stored[hubItem.Icon.Title] = .5
            hubItem.TabSelection.Visible = false
            hubItem.TabSelection.Size = UDim2.new(0,0,0,6)
            stored[hubItem.TabSelection] = 0
        end
    end))
    if hubItem == reguiSettingsHub then
        pageViewInnerFrame.Visible = true
        reguiInnerFrame.Visible = false
        local innerPlayer = pageViewInnerFrame:FindFirstChild("Players")
        if innerPlayer then
            game:GetService("RunService").RenderStepped:Wait()
            innerPlayer:FindFirstChild("ImageButton").Visible = true
        end
    end
end

setUnactive(reguiSettingsHub)

local down = {}

local lastActive = nil
local lastRbxActive = nil

for _,hubItem in pairs(hubBar:GetChildren()) do
	if hubItem.Name == "PlayersTab" then
		lastActive = hubItem
	end
    if not hubItem:IsA("UIListLayout") then
        hubItem.MouseButton1Down:Connect(function()
            down[hubItem] = true
        end)
        hubItem.MouseButton1Up:Connect(function()
            if down[hubItem] == true and lastActive ~= hubItem then
                setActive(hubItem)
                if lastActive then
                    setUnactive(lastActive)
                end
                lastActive = hubItem
                if hubItem ~= reguiSettingsHub then
                    lastRbxActive = hubItem
                end
            end
            for index,isdown in pairs(down) do
                down[index] = false
            end
        end)
    end
end

local escOpen = false

game:GetService("GuiService").MenuOpened:Connect(function()
    escOpen = true
end)

game:GetService("GuiService").MenuClosed:Connect(function()
    escOpen = false
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if reguiInnerFrame.Visible then
        pageView.CanvasSize = UDim2.new(0,0,0,16)
        pageView.ScrollBarImageTransparency = 1
        pageView.ScrollBarThickness = 0
    else
        pageView.ScrollBarImageTransparency = 0
        pageView.ScrollBarThickness = 12
    end
end)

local kC = Enum.KeyCode
local numKeys = {kC.One,kC.Two,kC.Three,kC.Four,kC.Five,kC.Six,kC.Seven,kC.Eight,kC.Nine,kC.Zero}
local useNumShortcut = false

UIS.InputBegan:Connect(function(IO)
    if IO.KeyCode == kC.Escape and hubBar:FindFirstChild("PlayersTab") and escOpen then
        wait(.55)
        if escOpen then
            return
        end
        if lastActive then
            setUnactive(lastActive)
        end
        setActive(hubBar.PlayersTab)
        lastActive = hubBar.PlayersTab
    end
    if escOpen and (IO.KeyCode == kC.R or IO.KeyCode == kC.L) then
        if lastActive == reguiSettingsHub then
            setUnactive(lastActive)
            setActive(lastRbxActive)
            lastActive = lastRbxActive
        end
    end
    if useNumShortcut then
        for i,numKey in pairs(numKeys) do
            if IO.KeyCode == numKey and escOpen then
                local hubItem = hubBar:GetChildren()[i+1]
                if not hubItem then
                    return
                end
                local vu = game:GetService("VirtualUser")
                local abs = hubItem.AbsolutePosition
                local vps = workspace.CurrentCamera.ViewportSize
                print("screensize is " .. tostring(vps))
                print("screenposition is " .. tostring(abs))
                print("vec2d_clickpos is " .. tostring(abs/vps))
                vu:Button1Down(abs)
                game:GetService("RunService").RenderStepped:Wait()
                vu:Button1Up(abs)
                local connections1 = getconnections(hubItem.MouseButton1Down)
                local connections2 = getconnections(hubItem.MouseButton1Up)
                for _,connection in pairs(connections1) do
                    connection.Function(connections1,abs.X,abs.Y)  
                end
                for _,connection in pairs(connections2) do
                    connection.Function(connections2,abs.X,abs.Y)
                end
            end
        end
    end
end)
