local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Rayfield = loadstring(('https://sirius.menu/rayfield'):HttpGet(game))()
local player = game.Players.LocalPlayer

local function ClaimQuest()
	ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ClaimQuestReward"):FireServer()
end

local function getQuestArea()
	return player.QuestArea.Value
end

local function sendPetsToZone(zone)
	local args = {
		[1] = zone
	}

	ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("OnAreaButton"):FireServer(unpack(args))
end

local function ClaimEgg()
	ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ClaimDailyEgg"):FireServer()
end

local function buyUpgrade(upgrade)
	local args = {
		[1] = upgrade
	}

	ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyStatIncrease"):FireServer(unpack(args))
end

local function fusePets()
	local args = {
		[1] = {
			[1] = true,
			[2] = true,
			[3] = true,
			[4] = true,
			[5] = true,
			[6] = true,
			[7] = true,
			[8] = false
		}
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AutoFuse"):FireServer(unpack(args))

end
---------------------------------------------------------------------------
local Window = Rayfield:CreateWindow({
	Name = "Collect All Pets",
	LoadingTitle = "Maplexito",
	LoadingSubtitle = "",
	ConfigurationSaving = {
		Enabled = false,
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

Main:CreateToggle({
	Name = "Auto quest",
	CurrentValue = false,
	Flag = "AutoQuest",
	Callback = function(value)
		shared.AutoQuest = value
		while shared.AutoQuest do
			task.wait()
			if not shared.AutoQuest then
				break
			end
			local QuestZone = getQuestArea()
			sendPetsToZone(QuestZone)
		end
	end,
})

Main:CreateToggle({
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

Main:CreateToggle({
	Name = "Auto claim egg",
	CurrentValue = false,
	Flag = "ClaimEgg",
	Callback = function(value)
		shared["ClaimEgg"] = value
		while shared["ClaimEgg"] do
			wait()
			if not shared["ClaimEgg"] then
				break
			end
			ClaimEgg()
		end
	end,
})

Main:CreateToggle({
	Name = "Auto fuse pets (20 sec cd)",
	CurrentValue = false,
	Flag = "AutoFuse",
	Callback = function(value)
		shared["AutoFuse"] = value
		while shared["AutoFuse"] do
			wait(20)
			if not shared["AutoFuse"] then
				break
			end
			fusePets()
		end
	end,
})

Main:CreateButton({
	Name = "Fuse pets",
	Callback = function()
		fusePets()
	end,
})

Main:CreateButton({
	Name = "Magnet max range",
	Callback = function()
		player.Magnet.Value = 9999999
		Rayfield:Notify({
			Title = "Cambiado con éxito",
			Content = "El valor del imán fue cambiado exitosamente",
			Duration = 5
		})
	end,
})

Main:CreateButton({
	Name = "Hatch max speed",
	Callback = function()
		player.HatchSpeedTier.Value = 999999
		Rayfield:Notify({
			Title = "Cambiado con éxito",
			Content = "El valor del Hatch speed fue cambiado exitosamente",
			Duration = 5
		})
	end,
})

local Upgrades = Window:CreateTab("Upgrades", 4483362458)

Upgrades:CreateToggle({
	Name = "Auto buy damage",
	CurrentValue = false,
	Flag = "BuyDmg",
	Callback = function(value)
		shared["BuyDamage"] = value
		while shared["BuyDamage"] do
			wait()
			if not shared["BuyDamage"] then
				break
			end
			buyUpgrade("Damage")
		end
	end,
})

Upgrades:CreateToggle({
	Name = "Auto buy drop rate",
	CurrentValue = false,
	Flag = "BuyDropRate",
	Callback = function(value)
		shared["BuyDropRate"] = value
		while shared["BuyDropRate"] do
			wait()
			if not shared["BuyDropRate"] then
				break
			end
			buyUpgrade("DropRate")
		end
	end,
})

local MISC = Window:CreateTab("Misc", 4483362458)

MISC:CreateButton({
	Name = "Destroy walls",
	Callback = function()
		workspace.AreaBarriers.AreaBarrier_8.Wall:Destroy()
		workspace.AreaBarriers.AreaBarrier_9.Wall:Destroy()
		workspace.AreaBarriers.AreaBarrier_10.Wall:Destroy()
	end,
})
