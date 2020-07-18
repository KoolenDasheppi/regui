local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local hubBar = robloxGui.SettingsShield:WaitForChild("SettingsShield"):WaitForChild("MenuContainer"):WaitForChild("HubBar")
local pageView = robloxGui.SettingsShield.SettingsShield.MenuContainer:WaitForChild("PageViewClipper"):WaitForChild("PageView")
local reguiSettingsHub = hubBar:WaitForChild("GameSettingsTab"):Clone()
reguiSettingsHub.Parent = hubBar
reguiSettingsHub.Name = "RGSettingsTab"
reguiSettingsHub.Icon.Title.Text = "REGUI Settings"
reguiSettingsHub.Icon.Title.TextSize = 12
reguiSettingsHub.Icon.Title.TextWrapped = 12
reguiSettingsHub.Icon.Image = "rbxassetid://5366905099"
for _,HUB in pairs(hubBar:GetChildren()) do
    if not HUB:IsA("UIListLayout") then
        HUB.Size = UDim2.new(0.165,0,1,0)
    end
end
local IsActive = false

local function setActive(hubItem)
    hubItem.Icon.ImageTransparency = 0
    hubItem.Icon.Title.TextTransparency = 0
    hubItem.TabSelection.Visible = true
    if hubItem == reguiSettingsHub then
        pageView.Visible = false
    end
end

local function setUnactive(hubItem)
    hubItem.Icon.ImageTransparency = .5
    hubItem.Icon.Title.TextTransparency = .5
    hubItem.TabSelection.Visible = false
    if hubItem == reguiSettingsHub then
        pageView.Visible = true
    end
end

setUnactive(reguiSettingsHub)

for _,hubItem in pairs(hubBar:GetChildren()) do
    if not hubItem:IsA("UIListLayout") then
        hubItem.MouseButton1Up:Connect(function()
            setActive(hubItem)
            for _,curhubItem in pairs(hubBar:GetChildren()) do
                if not curhubItem:IsA("UIListLayout") then
                    if curhubItem ~= hubItem then
                        setUnactive(curhubItem)
                    end
                end
            end
        end)
    end
end
