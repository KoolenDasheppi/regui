wait(1)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local hubBar = robloxGui:WaitForChild("SettingsShield"):WaitForChild("SettingsShield"):WaitForChild("MenuContainer"):WaitForChild("HubBar")
local pageView = robloxGui.SettingsShield.SettingsShield.MenuContainer:WaitForChild("PageViewClipper"):WaitForChild("PageView")
local pageViewInnerFrame = pageView:WaitForChild("PageViewInnerFrame")
local reguiInnerFrame = pageViewInnerFrame:Clone()
syn.protect_gui(reguiInnerFrame)
reguiInnerFrame.Parent = pageViewInnerFrame.Parent
reguiInnerFrame:ClearAllChildren()
local txtTest = Instance.new("TextLabel",reguiInnerFrame)
txtTest.Text = "unfinished"
txtTest.BackgroundTransparency = 1
txtTest.TextColor3 = Color3.fromRGB(255,255,255)
txtTest.TextScaled = true
txtTest.Size = UDim2.new(1,0,1,0)
robloxGui.SettingsShield.SettingsShield.BackgroundColor3 = Color3.fromRGB(70, 75, 86)
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
    end
end
local IsActive = false

local function setActive(hubItem)
    hubItem.Icon.ImageTransparency = 0
    hubItem.Icon.Title.TextTransparency = 0
    hubItem.TabSelection.Visible = true
    if hubItem == reguiSettingsHub then
        pageViewInnerFrame.Visible = false
        reguiInnerFrame.Visible = true
        local innerPlayer = pageViewInnerFrame:FindFirstChild("Players")
        if innerPlayer then
            game:GetService("RunService").RenderStepped:Wait()
            innerPlayer:FindFirstChild("ImageButton").Visible = false
        end
    end
end

local function setUnactive(hubItem)
    hubItem.Icon.ImageTransparency = .5
    hubItem.Icon.Title.TextTransparency = .5
    hubItem.TabSelection.Visible = false
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
