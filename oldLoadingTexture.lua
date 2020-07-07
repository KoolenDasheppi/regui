local RGB = Color3.fromRGB
local CoreGui = game:WaitForChild("CoreGui")
function createOldTexture()
	local oldTexture = Instance.new("ImageLabel")
	oldTexture.Image = "rbxasset://textures/loading/darkLoadingTexture.png"
	oldTexture.TileSize = UDim2.new(
		0,512,
		0,512
	)
	oldTexture.BorderSizePixel = 0
	oldTexture.BackgroundColor3 = RGB(45,45,45)
	return oldTexture
end
function vibeCheck(obj)
	if obj.Name == "RobloxLoadingGui" then
		local oldTexture = createOldTexture()
		oldTexture.Parent = obj:FindFirstChildOfClass("Frame")
	end
end
for i,dec in pairs(CoreGui:GetChildren()) do
	vibeCheck(dec)
end
CoreGui.ChildAdded:Connect(vibeCheck)