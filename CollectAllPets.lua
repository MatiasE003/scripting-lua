local RunService = game:GetService("RunService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local player = game.Players.LocalPlayer
local Areas = game.Workspace.Areas:GetChildren()

getgenv().ClaimQuest = true
getgenv().Hatch = true

local function ClaimQuest()
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimQuestReward"):FireServer()
end

--{{ Temporalmente sin uso
local function Hatch(egg)
	local args = {
		[1] = egg
		--1: common
		--2: uncommon
		--3: rare
		--4: epic
		--5: legendary
		--6: prodigious
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyEgg"):FireServer(unpack(args))
end
}}--
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

local Window = Rayfield:CreateWindow({
	Name = "Collect All Pets",
	LoadingTitle = "Maplexito",
	LoadingSubtitle = "",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "MaplexHub",
		FileName = "Collect All Pets"
	},
	Discord = {
		Enabled = false,
		Invite = "",
		RememberJoins = true
	},
	KeySystem = false,
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"CamilaBella"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

local Main = Window:CreateTab("Main", 4483362458)

local AutoQuest = Main:CreateToggle({
	Name = "Auto quest",
	CurrentValue = false,
	Flag = "AutoQuest",
	Callback = function(value)
		shared["AutoQuest"] = value
		while shared["AutoQuest"] do
			task.wait()
			if not shared["AutoQuest"] then
				break
			end
			sendPetsToQuest()
		end
	end,
})

local AutoClaim = Main:CreateToggle({
	Name = "Auto claim",
	CurrentValue = false,
	Flag = "AutoClaim",
	Callback = function(value)
		shared["AutoClaim"] = value
		while shared["AutoClaim"] do
			task.wait()
			if not shared["AutoClaim"] then
				break
			end
			ClaimQuest()
		end
	end,
})

local MaxMagnet = Main:CreateButton({
	Name = "Magnet max range",
	Callback = function()
		player.Magnet.Value = 9999999
	end,
})
