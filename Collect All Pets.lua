local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
local char = player.Character

local Areas = game.Workspace.Areas:GetChildren()

getgenv().ClaimQuest = true
getgenv().Hatch = false

local Magnet = 999999
local EggSpeed = 999999

player.Magnet.Value = Magnet
player.HatchSpeedTier.Value = EggSpeed
player.EnableEggHatchFade.Value = false

local function ClaimQuest()
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimQuestReward"):FireServer()
end

local function Hatch()
	local args = {
		[1] = 3
		--1: common
		--2: uncommon
		--3: rare
		--4: epic
		--5: legendary
		--6: prodigious
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyEgg"):FireServer(unpack(args))
end

local function getQuestArea()
	return player.QuestArea.Value
end

local function sendPetsToQuest()
	local QuestArea = getQuestArea()
	
	local args = {
		[1] = QuestArea
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("OnAreaButton"):FireServer(unpack(args))

end

RunService.Heartbeat:Connect(function()
	
	sendPetsToQuest()
	
	if getgenv().ClaimQuest then
		ClaimQuest()
	end
	
	if getgenv().Hatch then
		Hatch()
	end
end)
