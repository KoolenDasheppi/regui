return function(LocalPath)
    local MEM = {}
    MEM.UserInputService = game:GetService("UserInputService")
    MEM.RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
    MEM.SettingsSheild = MEM.RobloxGui:WaitForChild("SettingsShield"):WaitForChild("SettingsShield")
    MEM.MenuContainer = MEM.SettingsSheild:WaitForChild("MenuContainer")
    MEM.HubBar = MEM.MenuContainer:WaitForChild("HubBar")
    MEM.PageViewClipper = MEM.HubBar.Parent:WaitForChild("PageViewClipper")
    MEM.PageView = MEM.PageViewClipper:WaitForChild("PageView")
    MEM.PageViewInnerFrame = MEM.PageView:WaitForChild("PageViewInnerFrame")
    MEM.ReGuiInnerFrame = MEM.PageViewInnerFrame:Clone()
    syn.protect_gui(MEM.ReGuiInnerFrame)
    MEM.ReGuiInnerFrame.Parent = MEM.PageViewInnerFrame.Parent
    MEM.ReGuiInnerFrame:ClearAllChildren()
    MEM.ReGuiSettingsMenu = game:GetObjects(_ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"..","Assets","UI","EscMenu","Settings","SettingsMenu.rbxm")))[1]
    MEM.ReGuiSettingsMenu.Parent = MEM.ReGuiInnerFrame
    MEM.PanelHandler = _ReGui.Helper:Require(LocalPath,"PanelHandler.lua")
    MEM.PanelHandler(MEM.ReGuiSettingsMenu)
    MEM.SettingsSheild.BackgroundColor3 = Color3.fromRGB(70, 75, 86)
    MEM.HubBar.Image = _ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"..","Assets","UI","EscMenu","ColorableMenuBackground.png"))
    MEM.HubBar.ImageColor3 = Color3.fromRGB(78, 84, 96)
    MEM.ReGuiSettingsHub = MEM.HubBar:WaitForChild("GameSettingsTab"):Clone()
    MEM.ReGuiSettingsHub.Parent = MEM.HubBar
    MEM.ReGuiSettingsHub.Name = "RGSettingsTab"
    MEM.ReGuiSettingsHub.Icon.Title.Text = "ReGui Settings"
    MEM.ReGuiSettingsHub.Icon.Title.TextSize = 12
    MEM.ReGuiSettingsHub.Icon.Title.TextWrapped = 12
    MEM.ReGuiSettingsHub.Icon.Image = _ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"..","Assets","UI","EscMenu","Settings","RGSettings.png"))
    syn.protect_gui(MEM.ReGuiSettingsHub)
    for _,Hub in pairs(MEM.HubBar:GetChildren()) do
        if not Hub:IsA("UIListLayout") then
            Hub.Size = UDim2.new(0.165,0,1,0)
            Hub.Icon.Title.TextColor3 = Color3.fromRGB(255,255,255)
            Hub.Icon.Title.Font = Enum.Font.SourceSansBold
        end
    end

    MEM.RenderSteps = {}
    MEM.Stored = {}

    MEM.MakeActive = _ReGui.Helper:Require(LocalPath,"MakeHubItemActive.lua")
    MEM.MakeInactive = _ReGui.Helper:Require(LocalPath,"MakeHubItemInactive.lua")

    MEM.MakeInactive(MEM.ReGuiSettingsHub,MEM)

    MEM.EscOpen = false

    game:GetService("GuiService").MenuOpened:Connect(function()
        MEM.EscOpen = true
    end)
    
    game:GetService("GuiService").MenuClosed:Connect(function()
        MEM.EscOpen = false
    end)

    MEM.Down = {}
    MEM.LastActive = nil
    MEM.LastRbxActive = nil

    game:GetService("RunService").RenderStepped:Connect(function()
        if MEM.ReGuiInnerFrame.Visible then
            MEM.PageView.CanvasSize = UDim2.new(0,0,0,16)
            MEM.PageView.ScrollBarImageTransparency = 1
            MEM.PageView.ScrollBarThickness = 0
        else
            MEM.PageView.ScrollBarImageTransparency = 0
            MEM.PageView.ScrollBarThickness = 12
        end
    end)

    MEM.KC = Enum.KeyCode
    MEM.NumKeys = {MEM.KC.One,MEM.KC.Two,MEM.KC.Three,MEM.KC.Four,MEM.KC.Five,MEM.KC.Six,MEM.KC.Seven,MEM.KC.Eight,MEM.KC.Nine,MEM.KC.Zero}
    MEM.UseNumShortcut = false

    MEM.UserInputService.InputBegan:Connect(function(InputObject)
        if InputObject.KeyCode == MEM.KC.Escape and MEM.HubBar:FindFirstChild("PlayersTab") and EscOpen then
            wait(.55)
            if MEM.EscOpen then
                return
            end
            if MEM.LastActive then
                MEM.MakeInactive(MEM.LastActive,MEM)
            end
            MEM.MakeActive(MEM.HubBar.PlayersTab,MEM)
            MEM.LastActive = MEM.HubBar.PlayersTab
        end
        if MEM.EscOpen and (InputObject.KeyCode == MEM.KC.R or InputObject.KeyCode == MEM.KC.L) then 
            if MEM.LastActive == MEM.ReGuiSettingsHub then
                MEM.MakeInactive(MEM.LastActive,MEM)
                MEM.MakeActive(MEM.LastRbxActive,MEM)
                MEM.LastActive = MEM.LastRbxActive
            end
        end
    end)

    for _,HubItem in pairs(MEM.HubBar:GetChildren()) do
        if HubItem.Name == "PlayersTab" then
            MEM.LastActive = HubItem
        end
        if not HubItem:IsA("UIListLayout") then
            HubItem.MouseButton1Down:Connect(function()
                MEM.Down[HubItem] = true
            end)
            HubItem.MouseButton1Up:Connect(function()
                if MEM.Down[HubItem] == true and MEM.LastActive ~= HubItem then
                    MEM.MakeActive(HubItem,MEM)
                    if MEM.LastActive then
                        MEM.MakeInactive(MEM.LastActive,MEM)
                    end
                    MEM.LastActive = HubItem
                    if HubItem ~= MEM.ReGuiSettingsHub then
                        MEM.LastRbxActive = HubItem
                    end
                end
                for i,IsDown in pairs(MEM.Down) do
                    MEM.Down[i] = false
                end
            end)
        end
    end
end