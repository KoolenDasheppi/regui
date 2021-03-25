return function(LocalPath)

    local function PanelHandler(SettingsMenu)
        SettingsMenu.PanelContents.Title.Text = ""
        for _,Panel in pairs(SettingsMenu.PanelsFrame.Contents:GetChildren()) do
            if Panel:IsA("Frame") then
                Panel.PanelButton.Image = _ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"..","Assets","UI","EscMenu","Settings",Panel:GetAttribute("PanelReference"),"Icon.png"))
                local PanelObject = game:GetObjects(_ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"..","Assets","UI","EscMenu","Settings",Panel:GetAttribute("PanelReference"),"Panel.rbxm")))[1]
                PanelObject.Name = Panel:GetAttribute("PanelReference")
                local PanelEvent = Instance.new("BindableEvent")
                _ReGui.Helper:Require(_ReGui.Helper.Path:Join(LocalPath,"..","Assets","UI","EscMenu","Settings",Panel:GetAttribute("PanelReference")),"Panel.lua")(PanelObject,PanelEvent.Event)
                Panel.PanelButton.MouseButton1Up:Connect(function()
                    SettingsMenu.PanelContents.Title.Text = Panel:GetAttribute("PanelReference")
                    local CurPanel = SettingsMenu.PanelContents.Main:GetChildren()[1]
                    if CurPanel then
                        CurPanel.Parent = nil
                    end
                    PanelObject.Parent = SettingsMenu.PanelContents.Main
                    PanelEvent:Fire("Shown")
                end)
            end
        end
    end

    return PanelHandler
end