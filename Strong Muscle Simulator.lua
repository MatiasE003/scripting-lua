local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    LoadingTitle = "Maplex",
    LoadingSubtitle = "by Maplex",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Maplexito"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "Hello"
    }
})

local Tab = Window:CreateTab("Main", 4483362458)

Tab:CreateSection("Auto Click")

Tab:CreateToggle({
    Name = "Auto click",
    CurrentValue = false,
    Flag = "Auto click", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(x)
        shared["AutoClick"] = x
        if shared["AutoClick"] then
            game:GetService("Players").LocalPlayer.Data.AutoClick.Value = true
        else
            game:GetService("Players").LocalPlayer.Data.AutoClick.Value = false
        end
    end,
})

Tab:CreateSection("Auto rebirth")

Tab:CreateToggle({
    Name = "Auto rebirth",
    CurrentValue = false,
    Flag = "Auto rebirth", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(x)
        shared["AutoRebirth"] = x
        if shared["AutoRebirth"] then
            game:GetService("Players").LocalPlayer.Data.AutoRebirth.Value = true
        else
            game:GetService("Players").LocalPlayer.Data.AutoRebirth.Value = false
        end
    end,
})

local TP = Window:CreateTab("Teleport", 4483362458)

TP:CreateSection("Teleport")

TP:CreateButton({
    Name = "Teleport Skills",
    Callback = function()
        local teleportPart = game:GetService("Workspace").Safezone.SkillShop1
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoid = character:FindFirstChild("Humanoid")
        
        if humanoid then
            character:SetPrimaryPartCFrame(teleportPart.CFrame)
        end
    end,
})