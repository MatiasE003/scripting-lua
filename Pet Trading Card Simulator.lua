local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local function Click()
    game:GetService("ReplicatedStorage").Events.Click:FireServer()
end

local Packs = {}

for i,v in next, game:GetService("Workspace").BoosterPacks:GetChildren() do
    if v:isA("Model") then
        table.insert(Packs, v.Name)
    end
end

local function Buy_Pack(Pack)
    local args = {
        [1] = Pack,
        [2] = "single"
    }
    game:GetService("ReplicatedStorage").Functions.BuyBooster:InvokeServer(unpack(args))
end

local function Rebirth()
    game:GetService("ReplicatedStorage").Functions.BuyRebirth:InvokeServer()
end

-------------------------------------------------------------------------window-------------------------------------------------------------------------

local Window = Rayfield:CreateWindow({
    Name = "Maplex",
    LoadingTitle = "Maplex",
    LoadingSubtitle = "by Maplex",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "MaplexitoHub", -- Create a custom folder for your hub/game
       FileName = "Pet Trading Card Simulator"
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

local Farming = Window:CreateTab("Farming", 4483362458)

Farming:CreateSection("AutoClick")

Farming:CreateToggle({
    Name = "AutoClick",
    CurrentValue = false,
    Flag = "AutoClick",
    Callback = function(x)
        shared["Autoclick"] = x
        while shared["Autoclick"] do
            task.wait()
            if not shared["Autoclick"] then
                break
            end
            Click()
        end
    end,
})

Farming:CreateSection("AutoRebirth")

Farming:CreateToggle({
    Name = "Auto rebirth",
    CurrentValue = false,
    Flag = "Auto rebirth",
    Callback = function(x)
        shared["AutoRebirth"] = x
        while shared["AutoRebirth"] do
            task.wait()
            if not shared["AutoRebirth"] then
                break
            end
            Rebirth()
        end
    end,
})


local Packs_ = Window:CreateTab("Packs", 4483362458)

Packs_:CreateSection("Pack")

Packs_:CreateToggle({
    Name = "Abrir pack",
    CurrentValue = false,
    Flag = "pack", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(x)
        shared["Open"] = x
        while shared["Open"] do
            task.wait()
            if not shared["Open"] then
                break
            end
            Buy_Pack(shared.Pack)
        end
    end,
})

Packs_:CreateDropdown({
    Name = "Packs",
    Options = Packs,
    CurrentOption = Packs[1],
    Flag = "Huevo", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
        shared.Pack = Option
    end,
})