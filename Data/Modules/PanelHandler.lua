return function(LocalPath)

    local function PanelHandler(SettingsMenu)
        SettingsMenu.PanelContents.Title.Text = ""
        for _,Panel in pairs(SettingsMenu.PanelsFrame.Contents:GetChildren()) do
            if Panel:IsA("Frame") then
                Panel.PanelButton.Image = _ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"..","Assets","UI","EscMenu","Settings",Panel:GetAttribute("PanelReference"),"Icon.png"))
                Panel.PanelButton.MouseButton1Up:Connect(function()
                    SettingsMenu.PanelContents.Title.Text = Panel:GetAttribute("PanelReference")
                    SettingsMenu.PanelContents.Main:ClearAllChildren()
                    game:GetObjects(_ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"..","Assets","UI","EscMenu","Settings",Panel:GetAttribute("PanelReference"),"Panel.rbxm")))[1].Parent = SettingsMenu.PanelContents.Main
                end)
            end
        end
    end

    return PanelHandler
end