local RGB = Color3.fromRGB
local coreGui = game:WaitForChild("CoreGui")
local didVibe = nil
function createOldTexture(Parent)
	local oldTexture = Instance.new("ImageLabel",Parent)
	oldTexture.Image = "rbxasset://textures/loading/darkLoadingTexture.png"
	oldTexture.ScaleType = Enum.ScaleType.Tile
	oldTexture.TileSize = UDim2.new(
		0,512,
		0,512
	)
	oldTexture.BorderSizePixel = 0
	oldTexture.BackgroundColor3 = RGB(45,45,45)
	oldTexture.Size = UDim2.new(
		1,0,
		1,0
	)
	oldTexture.BackgroundTransparency = 1
	oldTexture.ZIndex = 1
	return oldTexture
end
function vibeCheck(obj)
	if didVibe then
		return
	end
	if obj.Name == "RobloxLoadingGui" then
		local Frame = obj:FindFirstChildOfClass("Frame")
		Frame.ZIndex = 0
		local oldTexture = createOldTexture(Frame)
		didVibe = oldTexture
	end
end
function vibeCheckAll()
	for i,dec in pairs(coreGui:GetChildren()) do
		vibeCheck(dec)
	end
end
function OnRender()
	if didVibe and didVibe.Parent then
		didVibe.ImageTransparency = didVibe.Parent.BackgroundTransparency
	end
	vibeCheckAll()
end
game:GetService("RunService").RenderStepped:Connect(OnRender)
