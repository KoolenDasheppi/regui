ui = Instance.new("ScreenGui")
local fr1 = Instance.new("Frame")
local lay2 = Instance.new("UIListLayout")
local pi = Instance.new("ImageButton")
local pad = Instance.new("Frame")
local plat = Instance.new("ImageLabel")
local icn = Instance.new("ImageLabel")
local pn = Instance.new("TextLabel")
ui.Name = "reguiplayerlist"
if game:GetService("RunService"):IsStudio() then
	ui.Parent = game.Players.LocalPlayer.PlayerGui
else
	syn.protect_gui(ui)
	ui.Parent = game.CoreGui
end
ui.ResetOnSpawn = false
fr1.Name = "list_frm"
fr1.Parent = ui
fr1.Position = UDim2.new(1, -5, 0, 5)
fr1.Size = UDim2.new(0, 192, 1, -10)
fr1.AnchorPoint = Vector2.new(1, 0)
fr1.BackgroundColor = BrickColor.new("Institutional white")
fr1.BackgroundColor3 = Color3.new(1, 1, 1)
fr1.BackgroundTransparency = 1
lay2.Name = "layout"
lay2.Parent = fr1
lay2.SortOrder = Enum.SortOrder.LayoutOrder
lay2.Padding = UDim.new(0, 8)
pi.Name = "player_item"
pi.Parent = lay2
pi.Size = UDim2.new(0, 192, 0, 24)
pi.BackgroundColor = BrickColor.new("Black")
pi.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
pi.BackgroundTransparency = 1
pi.BorderSizePixel = 0
pi.Image = "rbxassetid://2790389767"
pi.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
pi.ScaleType = Enum.ScaleType.Slice
pi.SliceCenter = Rect.new(8, 8, 248, 248)
pad.Name = "pad"
pad.Parent = pi
pad.Position = UDim2.new(0, 4, 0, 2)
pad.Size = UDim2.new(1, -8, 1, -4)
pad.BackgroundColor = BrickColor.new("Institutional white")
pad.BackgroundColor3 = Color3.new(1, 1, 1)
pad.BackgroundTransparency = 1
plat.Name = "platform"
plat.Parent = pad
plat.Size = UDim2.new(0, 20, 0, 20)
plat.BackgroundColor = BrickColor.new("Institutional white")
plat.BackgroundColor3 = Color3.new(1, 1, 1)
plat.BackgroundTransparency = 1
plat.Image = "rbxassetid://5273747925"
plat.ImageRectSize = Vector2.new(512, 512)
icn.Name = "icon"
icn.Parent = pad
icn.Position = UDim2.new(0, 25, 0, 0)
icn.Size = UDim2.new(0, 20, 0, 20)
icn.BackgroundColor = BrickColor.new("Institutional white")
icn.BackgroundColor3 = Color3.new(1, 1, 1)
icn.BackgroundTransparency = 1
icn.LayoutOrder = 1
icn.Image = "rbxasset://textures/ui/Settings/Players/FriendIcon@2x.png"
pn.Name = "playername"
pn.Parent = pad
pn.Position = UDim2.new(0, 50, 0, 0)
pn.Size = UDim2.new(1, -55, 1, 0)
pn.BackgroundColor = BrickColor.new("Institutional white")
pn.BackgroundColor3 = Color3.new(1, 1, 1)
pn.BackgroundTransparency = 1
pn.LayoutOrder = 2
pn.Font = Enum.Font.SourceSansBold
pn.FontSize = Enum.FontSize.Size18
pn.Text = "Username"
pn.TextColor = BrickColor.new("Institutional white")
pn.TextColor3 = Color3.new(1, 1, 1)
pn.TextSize = 15
pn.TextWrap = true
pn.TextWrapped = true
pn.TextXAlignment = Enum.TextXAlignment.Left

local _base_teamlabel = ui.list_frm.layout.player_item:Clone()
_base_teamlabel.Name = "team_label"
_base_teamlabel.pad.playername.Name = "teamname"
_base_teamlabel.pad.teamname.Text = "Team"
_base_teamlabel.pad.icon:Destroy()
_base_teamlabel.pad.platform:Destroy()
_base_teamlabel.pad.teamname.Size = UDim2.new(1,0,1,0)
_base_teamlabel.pad.teamname.Position = UDim2.new(0,0,0,0)
_base_teamlabel.ImageColor3 = Color3.fromRGB(59, 59, 59)
_base_teamlabel.ImageTransparency = .5
_base_teamlabel.pad.teamname.TextStrokeTransparency = .25
_base_teamlabel.pad.teamname.TextStrokeColor3 = Color3.new(1,1,1)
ui.list_frm.layout.player_item.ImageTransparency = .75
ui.list_frm.layout.player_item.pad.playername.TextStrokeTransparency = .25
ui.list_frm.layout.player_item.pad.playername.TextStrokeColor3 = Color3.new(1,1,1)

local platformIcons = {
	pcAndMobile = "rbxassetid://5273747925",
	console = "rbxassetid://5274004481",
	moreIcons = "rbxassetid://5295964612"
}
local vec2 = Vector2.new
local vec3 = Vector3.new
local ud2 = UDim2.new
local players = game.Players
--TODO: when the custom esc menu is done make this a setting in the player list settings in regui
if not _G.rg_settings then
	_G.rg_settings = {}
end
local settings = {
	update_sec = {
		value = 0,
		name = "Update Rate"
	}
}
_G.rg_settings.playerlist = {
	values = settings,
	title = "Player List",
	section = "REGUI"
}
local update_sec = settings.update_sec
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Open = true
local listOffInfo = TweenInfo.new(
	.5, -- Time
	Enum.EasingStyle.Exponential, -- EasingStyle
	Enum.EasingDirection.Out, -- EasingDirection
	0, -- RepeatCount 
	false, -- Reverses
	0 -- DelayTime
)
local listOffGoal = {Position = ud2(1,0,0,5), AnchorPoint = vec2(0,0)}
local listOnInfo = TweenInfo.new(
	.5, -- Time
	Enum.EasingStyle.Exponential, -- EasingStyle
	Enum.EasingDirection.Out, -- EasingDirection
	0, -- RepeatCount
	false,
	0 -- DelayTime
)
local listOnGoal = {Position = ud2(1,-5,0,5), AnchorPoint = vec2(1,0)}
local platformOffsets = {
	Win32 = {
		image = platformIcons.pcAndMobile,
		offset = vec2(0,512),
		hover = "Windows (32Bit Binary)"
	},
	Win64 = {
		image = platformIcons.pcAndMobile,
		offset = vec2(0,512),
		hover = "Windows (64Bit Binary)"
	},
	Linux32 = {
		image = platformIcons.moreIcons,
		offset = vec2(512,0),
		hover = "Linux (32Bit Binary)"
	},
	Linux64 = {
		image = platformIcons.moreIcons,
		offset = vec2(512,0),
		hover = "Linux (64Bit Binary)"
	},
	PS4 = {
		image = platformIcons.console,
		offset = vec2(512,0),
		hover = "PS4"
	},
	Switch = {
		image = platformIcons.console,
		offset = vec2(0,512),
		hover = "Nintendo Switch"
	},
	Windows_Universal = {
		image = platformIcons.moreIcons,
		offset = vec2(0,0),
		hover = "Windows (UWP)"
	},
	Android = {
		image = platformIcons.pcAndMobile,
		offset = vec2(0,0),
		hover = "Android"
	},
	iOS = {
		image = platformIcons.pcAndMobile,
		offset = vec2(512,0),
		hover = "iOS"
	},
	MacOS = {
		image = platformIcons.pcAndMobile,
		offset = vec2(512,512),
		hover = "Mac OS"
	},
	OSX = {
		image = platformIcons.pcAndMobile,
		offset = vec2(512,512),
		hover = "OSX"
	},
	Durango = {
		image = platformIcons.console,
		offset = vec2(0,0),
		hover = "Xbox One"
	},
	Unknown = {
		image = platformIcons.console,
		offset = vec2(512,512)
	},
}

local function getPlatformIcon(osPlatform)
	if platformOffsets[osPlatform] then
		return platformOffsets[osPlatform].image, platformOffsets[osPlatform].offset, platformOffsets[osPlatform].hover
	else
		return platformOffsets.Unknown.image, platformOffsets.Unknown.offset, osPlatform .. " (Unknown)"
	end
end

local function getPlatform(player)
	if game:GetService("RunService"):IsStudio() then
		return "Win32"
	else
		return player.OsPlatform
	end
end

local group_roblox = 1200769
local group_star = 4199740

local icon = {
	friend = "rbxasset://textures/ui/PlayerList/FriendIcon@3x.png",
	admin = "rbxasset://textures/ui/PlayerList/AdminIcon@3x.png",
	intern = "rbxasset://textures/ui/PlayerList/AdminIcon@3x.png",
	premium = "rbxasset://textures/ui/PlayerList/PremiumIcon@3x.png",
	owner = "rbxasset://textures/ui/PlayerList/OwnerIcon@3x.png",
	star = "rbxasset://textures/ui/PlayerList/StarIcon@3x.png",
	follow = "rbxasset://textures/ui/PlayerList/FollowingIcon@3x.png",
}

local Infos = {}

local function getInfo(player)
	if not Infos[player] then
		Infos[player] = {
			IsFriends = false,
			MembershipType = player.MembershipType,
			StaffRank = 0,
			StarCreator = false,
			Owner = player.UserId == game.CreatorId
		}
		coroutine.resume(coroutine.create(function()
			Infos[player] = {
				IsFriends = player:IsFriendsWith(game.Players.LocalPlayer.UserId),
				MembershipType = player.MembershipType,
				StaffRank = player:GetRoleInGroup(group_roblox),
				StarCreator = player:GetRoleInGroup(group_star) == 1,
				Owner = player.UserId == game.CreatorId
			}
		end))
	end
	return Infos[player]
end

local function getPlayerList()
	local List = {}
	for i,player in pairs(game.Players:GetPlayers()) do
		local team = player.Team
		local teaminfo = {"Players",Color3.new(255,255,255)}
		if team then
			teaminfo = {team.Name,team.TeamColor.Color}
		end
		if not List[teaminfo[1]] then
			List[teaminfo[1]] = {
				list={},
				teaminfo = teaminfo
			}
		end
		table.insert(List[teaminfo[1]].list,player)
	end
	return List
end

local function drawList()
	local allplayers = getPlayerList()
	local base_plr = ui.list_frm.layout.player_item
	local base_team = _base_teamlabel
	for i,tab in pairs(allplayers) do
		local base_teamlabel = base_team:Clone()
		base_teamlabel.Parent = ui.list_frm
		base_teamlabel.pad.teamname.Text = tab.teaminfo[1]
		base_teamlabel.pad.teamname.TextColor3 = tab.teaminfo[2]
		local t_h,t_s,t_v = Color3.toHSV(tab.teaminfo[2])
		if t_s > .1 then
			base_teamlabel.pad.teamname.TextColor3 = Color3.fromHSV(t_h,1,1)
			base_teamlabel.pad.teamname.TextStrokeColor3 = Color3.fromHSV(t_h,.8,.8)
			base_teamlabel.pad.teamname.TextStrokeTransparency = .75
		else
			base_teamlabel.pad.teamname.TextStrokeTransparency = 1
		end
		for i,player in pairs(tab.list) do
			local player_item = base_plr:Clone()
			player_item.Parent = ui.list_frm
			player_item.pad.playername.Text = player.Name
			player_item.pad.playername.TextColor3 = tab.teaminfo[2]
			local t_h,t_s,t_v = Color3.toHSV(tab.teaminfo[2])
			if t_s > .1 then
				player_item.pad.playername.TextColor3 = Color3.fromHSV(t_h,1,1)
				player_item.pad.playername.TextStrokeColor3 = Color3.fromHSV(t_h,.8,.8)
				player_item.pad.playername.TextStrokeTransparency = .75
			else
				player_item.pad.playername.TextStrokeTransparency = 1
			end
			local platformImage,platformOffset,hoverText = getPlatformIcon(getPlatform(player))
			player_item.pad.platform.Image = platformImage
			player_item.pad.platform.ImageRectOffset = platformOffset
			local info = getInfo(player)
			local HasIcon = false
			if info.MembershipType == Enum.MembershipType.Premium then
				HasIcon = true
				player_item.pad.icon.Image = icon.premium
			end
			if info.StarCreator then
				HasIcon = true
				player_item.pad.icon.Image = icon.star
			end
			if info.Owner then
				HasIcon = true
				player_item.pad.icon.Image = icon.owner
			end
			if info.IsFriends then
				HasIcon = true
				player_item.pad.icon.Image = icon.friend
			end
			if not HasIcon then
				player_item.pad.icon:Destroy()
				player_item.pad.playername.Size = ud2(1,-35,1,0)
				player_item.pad.playername.Position = ud2(0,25,0,0)
			end
		end
	end
end

local function emptyList()
	for i,player_item in pairs(ui.list_frm:GetChildren()) do
		if player_item.Name ~= "layout" then
			player_item:Destroy()
		end
	end
end

local function listChanged()
	emptyList()
	drawList()
	ui.Enabled = game.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
end

game.Players.PlayerAdded:Connect(listChanged)
game.Players.PlayerRemoving:Connect(listChanged)
listChanged()

if not game:GetService("RunService"):IsStudio() then
	--local PlayerListMaster = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("PlayerListMaster"):WaitForChild("OffsetFrame"):WaitForChild("PlayerScrollList"):WaitForChild("SizeOffsetFrame"):WaitForChild("ScrollingFrameContainer"):WaitForChild("ScrollingFrameClippingFrame"):WaitForChild("ScollingFrame"):WaitForChild("OffsetUndoFrame")
	local PlayerListMaster = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("PlayerListMaster")
	PlayerListMaster.Changed:Connect(function()
		PlayerListMaster.Visible = false
	end)
	PlayerListMaster.Visible = false
end

UIS.InputBegan:Connect(function(InpOBJ)
	if InpOBJ.KeyCode == Enum.KeyCode.Tab then
		Open = not Open
		if Open then
			TS:Create(ui.list_frm,listOnInfo,listOnGoal):Play()
		else
			TS:Create(ui.list_frm,listOffInfo,listOffGoal):Play()
		end
		--ui.list_frm.Visible = not ui.list_frm.Visible
	end
end)

if update_sec.value <= 0 then
	game:GetService("RunService").RenderStepped:Connect(listChanged)
else
	while wait(update_sec.value) do
		listChanged()
	end
end
