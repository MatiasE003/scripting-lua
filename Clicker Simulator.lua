local function Hatch(Egg)

    local args = {
        [1] = "Client",
        [2] = "PurchaseEgg2",
        [3] = Egg,
        [4] = true,
        [5] = true,
        [7] = false,
        [8] = false
    }

    game:GetService("ReplicatedStorage").Events.ClientToServer.ClientToServerFunction:InvokeServer(unpack(args))
end

local function Rebirth(cantidad)

    local args = {
        [1] = "LocalScript",
        [2] = "RequestRebirth",
        [3] = cantidad,
        [4] = false,
        [5] = false
    }

    game:GetService("ReplicatedStorage").Events.ClientToServer.ClientToServerEvent:FireServer(unpack(args))

end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    LoadingTitle = "Loading script",
    LoadingSubtitle = "by Maplex",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Maplex"
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

Tab:CreateSection("Auto Hatch")

Tab:CreateToggle({
    Name = "Auto Hatch",
    CurrentValue = false,
    Flag = "Auto Hatch", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(x)
        shared["Auto Hatch"] = x
        while shared["Auto Hatch"] do
            task.wait()
            if not shared["Auto Hatch"] then
                break
            end
            Hatch("Earth")
        end
    end,
})

Tab:CreateSection("Rebirths")

Tab:CreateToggle({
    Name = "Rebirth",
    CurrentValue = false,
    Flag = "Rebirth", 
    Callback = function(x)
        shared["AutoRebirth"] = x
        while shared["AutoRebirth"] do
            task.wait()
            if not shared["AutoRebirth"] then
                break
            end
            Rebirth(10)
        end
    end,
})