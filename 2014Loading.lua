local RGB = Color3.fromRGB
local vec2 = Vector2.new
local vec3 = Vector3.new
local ud2 = UDim2.new
local coreGui = game:WaitForChild("CoreGui")
local didVibe = nil
local curSpin = nil
local curFrame = nil
function createOldTexture(Parent)
	local oldTexture = Instance.new("ImageLabel",Parent)
	oldTexture.Image = "rbxasset://textures/loading/darkLoadingTexture.png"
	oldTexture.ScaleType = Enum.ScaleType.Tile
	oldTexture.TileSize = ud2(
		0,512,
		0,512
	)
	oldTexture.BorderSizePixel = 0
	oldTexture.BackgroundColor3 = RGB(45,45,45)
	oldTexture.Size = ud2(
		1,0,
		1,0
	)
	oldTexture.BackgroundTransparency = 1
	oldTexture.ZIndex = 1
	return oldTexture
end
local LoadingDots = 0
local SpinnerRS
function createOldSpinner(Parent)
	local oldSpinner = Instance.new("ImageLabel",Parent)
	oldSpinner.Name = "oldSpinner"
	oldSpinner.Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png"
	oldSpinner.BackgroundTransparency = 1
	oldSpinner.Size = ud2(1,0,1,0)
	oldSpinner.ZIndex = 2
	local oldSpinnerText = Instance.new("TextLabel",Parent)
	oldSpinnerText.Name = "oldSpinnerText"
	oldSpinnerText.Size = ud2(1,0,.25,0)
	oldSpinnerText.AnchorPoint = vec2(0,.5)
	oldSpinnerText.Position = ud2(0,0,.5,0)
	oldSpinnerText.BackgroundTransparency = 1
	oldSpinnerText.TextColor3 = RGB(255,255,255)
	oldSpinnerText.ZIndex = 2
	return oldSpinner
end
function vibeCheck(obj)
	if obj.Name == "RobloxLoadingGui" then
		local Frame = obj:FindFirstChildOfClass("Frame")
		if Frame then
			curFrame = Frame
			Frame.ZIndex = 0
			Frame.GraphicsFrame.LoadingImage.Visible = false
			Frame.InfoFrame.PlaceIcon.ZIndex = 2
			Frame.InfoFrame.Position = ud2(.05,0,0.95,0)
			Frame.InfoFrame.AnchorPoint = vec2(0,1)
			Frame.InfoFrame.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
			--Frame.InfoFrame.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
			Frame.InfoFrame.Size = ud2(0.5,0,1,0)
			if not didVibe then
				local oldTexture = createOldTexture(Frame)
				local oldSpinner = createOldSpinner(Frame.GraphicsFrame)
				didVibe = oldTexture
				curSpin = oldSpinner
				SpinnerRS = game:GetService("RunService").RenderStepped:Connect(function()
					curSpin.Rotation = elapsedTime()*180
				end)
				return
			end
		end
	end
end
function vibeCheckAll()
	for i,dec in pairs(coreGui:GetChildren()) do
		vibeCheck(dec)
	end
end
function OnRender()
	if didVibe and didVibe.Parent then
		local t = (didVibe.Parent.BackgroundTransparency/2) + .5
		didVibe.ImageTransparency = curFrame.BackgroundTransparency
		curSpin.ImageTransparency = curFrame.BackgroundTransparency
		curFrame.GraphicsFrame.oldSpinnerText.TextTransparency = curFrame.BackgroundTransparency
		curFrame.InfoFrame.PlaceIcon.ImageTransparency = curFrame.BackgroundTransparency
	end
	vibeCheckAll()
end
game:GetService("RunService").RenderStepped:Connect(OnRender)
local started = false
while true do
	if curSpin and curSpin.Parent then
		started = true
		LoadingDots = LoadingDots + 1
		if LoadingDots > 3 then
			LoadingDots = 0
		end
		curSpin.Parent.oldSpinnerText.Text = "Loading" .. string.rep(".",LoadingDots)
		wait(.5)
	else
		if started then
			SpinnerRS:Disconnect()
			break
		else
			wait()
		end
	end
end
