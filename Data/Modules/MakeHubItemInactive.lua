return function(LocalPath)
    local Lerp = _ReGui.Helper:Require(LocalPath,"Lerp.lua")
    local function MakeInactive(HubItem,MEM)
        HubItem.TabSelection.Position = UDim2.new(.5,0,1,-6)
        HubItem.TabSelection.AnchorPoint = Vector2.new(.5,0)
        coroutine.resume(coroutine.create(function()
            if MEM.RenderSteps[HubItem] then
                MEM.RenderSteps[HubItem]:Disconnect()
            end
            HubItem.Icon.ImageTransparency = 0
            MEM.Stored[HubItem.Icon] = 0
            HubItem.Icon.Title.TextTransparency = 0
            MEM.Stored[HubItem.Icon.Title] = 0
            HubItem.TabSelection.Visible = true
            HubItem.TabSelection.Size = UDim2.new(1,0,0,6)
            MEM.Stored[HubItem.TabSelection] = 1
            local RenderSteppedEvent
            RenderSteppedEvent = game:GetService("RunService").RenderStepped:Connect(function(DeltaTime)
                HubItem.Icon.ImageTransparency = Lerp(MEM.Stored[HubItem.Icon],.5,DeltaTime*25)
                MEM.Stored[HubItem.Icon] = HubItem.Icon.ImageTransparency
                HubItem.Icon.Title.TextTransparency = Lerp(MEM.Stored[HubItem.Icon.Title],.5,DeltaTime*25)
                MEM.Stored[HubItem.Icon.Title] = HubItem.Icon.Title.TextTransparency
                HubItem.TabSelection.Size = UDim2.new(Lerp(MEM.Stored[HubItem.TabSelection],0,DeltaTime*25),0,0,6)
                MEM.Stored[HubItem.TabSelection] = HubItem.TabSelection.Size.X.Scale
            end)
            MEM.RenderSteps[HubItem] = RenderSteppedEvent
            wait(.5)
            if MEM.RenderSteps[HubItem] == RenderSteppedEvent then
                HubItem.Icon.ImageTransparency = .5
                MEM.Stored[HubItem.Icon] = .5
                HubItem.Icon.Title.TextTransparency = .5
                MEM.Stored[HubItem.Icon.Title] = .5
                HubItem.TabSelection.Visible = false
                HubItem.TabSelection.Size = UDim2.new(0,0,0,6)
                MEM.Stored[HubItem.TabSelection] = 0
            end
        end))
        if HubItem.Name == "RGSettingsTab" then
            MEM.PageViewInnerFrame.Visible = true
            MEM.ReGuiInnerFrame.Visible = false
            local InnerPlayer = MEM.PageViewInnerFrame:FindFirstChild("Players")
            if InnerPlayer then
                game:GetService("RunService").RenderStepped:Wait()
                InnerPlayer:FindFirstChild("ImageButton").Visible = true
            end
        end
    end

    return MakeInactive
end