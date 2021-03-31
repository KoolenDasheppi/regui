return function(LocalPath)
    
    local function PluginPanel(PanelObject,PanelEvent)

        local TweenService = game:GetService("TweenService")

        local function GetPluginList()
            local Plugins = _ReGui.ThirdPartyPluginHandler:GetPlugins()
            local NewList = {}
            for i,PluginName in pairs(Plugins) do
                NewList[PluginName] = {
                    Meta = _ReGui.ThirdPartyPluginHandler:GetPluginMeta(PluginName);
                    IsEnabled = _ReGui.ThirdPartyPluginHandler:WasEnabled(PluginName);
                    IsLoaded = false;
                }
                if NewList[PluginName].IsEnabled then
                    NewList[PluginName] = _ReGui.ThirdPartyPluginHandler:Load(PluginName)
                    NewList[PluginName].Meta = _ReGui.ThirdPartyPluginHandler:GetPluginMeta(PluginName)
                    NewList[PluginName].IsLoaded = true
                end
            end
            return NewList
        end
        
        local PluginsList
        local PluginItemPlaceholder = _ReGui.Helper.Asset:Insert(_ReGui.Helper.Path:Join(LocalPath,"PluginItem.rbxm"))[1]

        local ToggleTweenInfo = TweenInfo.new(
            .5, -- Time
            Enum.EasingStyle.Back, -- EasingStyle
            Enum.EasingDirection.InOut, -- EasingDirection
            0, -- RepeatCount (when less than zero the tween will loop indefinitely)
            false, -- Reverses (tween will reverse once reaching it's goal)
            0 -- DelayTime
        )

        local ToggleEnabledGoal = {
            Position = UDim2.new(0.65,0,0,0);
            ImageColor3 = Color3.fromRGB(50,181,255);
        }
        local ToggleEnabledColor = {
            ImageColor3 = Color3.fromRGB(50,181,255);
        }


        local ToggleDisabledGoal = {
            Position = UDim2.new(0.35,0,0,0);
            ImageColor3 = Color3.fromRGB(255, 62, 60);
        }

        local ToggleDisabledColor = {
            ImageColor3 = Color3.fromRGB(255, 62, 60);
        }
        
        local UIEvents = {}
        local function UpdatePluginList()
            --//Update the plugins table
            PluginsList = GetPluginList()
            --//Disconnect any unneeded events
            for _,UIEvent in pairs(UIEvents) do
                UIEvent:Disconnect()
            end
            --//Clear out the old plugin items
            for _,Obj in pairs(PanelObject:GetChildren()) do
                if Obj:IsA("Frame") then
                    Obj:Destroy()
                end
            end

            --//Create the plugin items
            for PluginName,Plugin in pairs(PluginsList) do
                local PluginItem = PluginItemPlaceholder:Clone()
                PluginItem.Contents.PluginIconFrame.PluginIcon.Image = Plugin.Meta.Thumb.StaticThumb
                if Plugin.Meta.Thumb.AnimThumb then
                    PluginItem.Contents.PluginIconFrame.PluginVideo.Video = Plugin.Meta.Thumb.AnimThumb
                    PluginItem.Contents.PluginIconFrame.PluginVideo.Visible = false
                    table.insert(UIEvents,PluginItem.Contents.MouseEnter:Connect(function()
                        PluginItem.Contents.PluginIconFrame.PluginVideo.Visible = true
                        PluginItem.Contents.PluginIconFrame.PluginVideo.TimePosition = 0
                        PluginItem.Contents.PluginIconFrame.PluginVideo:Play()
                    end))
    
                    table.insert(UIEvents,PluginItem.Contents.MouseLeave:Connect(function()
                        PluginItem.Contents.PluginIconFrame.PluginVideo.Visible = false
                        PluginItem.Contents.PluginIconFrame.PluginVideo:Pause()
                    end))
                else
                    PluginItem.Contents.PluginIconFrame.PluginVideo:Destroy()
                end
                PluginItem.Contents.TextArea.Title.Text = Plugin.Meta.Title
                PluginItem.Contents.TextArea.Desc.Text = Plugin.Meta.Desc
                PluginItem.Contents.TextArea.Creator.Text = "Created by: " .. Plugin.Meta.Creator

                PluginItem.Contents.ToggleFrame.Visible = true
                PluginItem.Contents.ToggleFrame.RGToggleInner.Image = _ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"RGToggle","RGToggleInner.png"))
                PluginItem.Contents.ToggleFrame.RGToggleOutline.Image = _ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"RGToggle","RGToggleOutline.png"))
                PluginItem.Contents.ToggleFrame.RGToggleBall.Image = _ReGui.Helper.Asset:Get(_ReGui.Helper.Path:Join(LocalPath,"RGToggle","RGToggleBall.png"))

                table.insert(UIEvents,PluginItem.Contents.ToggleFrame.RGToggleBall.MouseButton1Up:Connect(function()
                    if Plugin.IsEnabled then
                        local BallTween = TweenService:Create(PluginItem.Contents.ToggleFrame.RGToggleBall, ToggleTweenInfo, ToggleDisabledGoal)
                        local ColorTween1 = TweenService:Create(PluginItem.Contents.ToggleFrame.RGToggleInner, ToggleTweenInfo, ToggleDisabledColor)
                        local ColorTween2 = TweenService:Create(PluginItem.Contents.ToggleFrame.RGToggleOutline, ToggleTweenInfo, ToggleDisabledColor)
                        BallTween:Play()
                        ColorTween1:Play()
                        ColorTween2:Play()
                        Plugin:Disable(i)
                        _ReGui.ThirdPartyPluginHandler:Unload()
                    else
                        local BallTween = TweenService:Create(PluginItem.Contents.ToggleFrame.RGToggleBall, ToggleTweenInfo, ToggleEnabledGoal)
                        local ColorTween1 = TweenService:Create(PluginItem.Contents.ToggleFrame.RGToggleInner, ToggleTweenInfo, ToggleEnabledColor)
                        local ColorTween2 = TweenService:Create(PluginItem.Contents.ToggleFrame.RGToggleOutline, ToggleTweenInfo, ToggleEnabledColor)
                        BallTween:Play()
                        ColorTween1:Play()
                        ColorTween2:Play()
                        Plugin:Enable()
                    end
                    _ReGui.ThirdPartyPluginHandler:SetWasEnabled(PluginName,Plugin.IsEnabled)
                end))

                if Plugin.IsEnabled then
                    for Key,Value in pairs(ToggleEnabledGoal) do
                        PluginItem.Contents.ToggleFrame.RGToggleBall[Key] = Value
                    end
                    for Key,Value in pairs(ToggleEnabledColor) do
                        PluginItem.Contents.ToggleFrame.RGToggleInner[Key] = Value
                        PluginItem.Contents.ToggleFrame.RGToggleOutline[Key] = Value
                    end
                    --_ReGui.ThirdPartyPluginHandler:Unload(PluginName)
                    --Plugins[PluginName].IsLoaded = false
                else
                    if not Plugin.IsLoaded then
                        PluginsList[PluginName] = _ReGui.ThirdPartyPluginHandler:Load(PluginName)
                        PluginsList[PluginName].Meta = _ReGui.ThirdPartyPluginHandler:GetPluginMeta(PluginName)
                        PluginsList[PluginName].IsLoaded = true
                    end
                    for Key,Value in pairs(ToggleDisabledGoal) do
                        PluginItem.Contents.ToggleFrame.RGToggleBall[Key] = Value
                    end
                    for Key,Value in pairs(ToggleDisabledColor) do
                        PluginItem.Contents.ToggleFrame.RGToggleInner[Key] = Value
                        PluginItem.Contents.ToggleFrame.RGToggleOutline[Key] = Value
                    end
                end

                PluginItem.Parent = PanelObject
            end
        end

        PanelEvent:Connect(function(EventName)
            if EventName == "Shown" then
                UpdatePluginList()
            elseif EventName == "Hidden" then

            end
        end)
    end

    return PluginPanel
end