local RGB = Color3.fromRGB
local coreGui = game:WaitForChild("CoreGui")
local didVibe = false
function createOldTexture()
	local oldTexture = Instance.new("ImageLabel")
	oldTexture.Image = "rbxasset://textures/loading/darkLoadingTexture.png"
	oldTexture.TileSize = UDim2.new(
		0,512,
		0,512
	)
	oldTexture.BorderSizePixel = 0
	oldTexture.BackgroundColor3 = RGB(45,45,45)
	oldTexture.Size = Udim2.new(
		1,0
		1,0
	)
	return oldTexture
end
function vibeCheck(obj)
	if didVibe then
		return
	end
	if obj.Name == "RobloxLoadingGui" then
		local oldTexture = createOldTexture()
		oldTexture.Parent = obj:FindFirstChildOfClass("Frame")
		didVibe = true
	end
end
function vibeCheckAll()
	for i,dec in pairs(coreGui:GetChildren()) do
		vibeCheck(dec)
	end
end
vibeCheckAll()
game:GetService("RunService").RenderStepped:Connect(vibeCheckAll)
