--Librería
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))();

--variables
local function addPower()
    local args = {
        [1] = game:GetService("Players").LocalPlayer;
    }
    game:GetService("ReplicatedStorage").Knif.Knit.Services.PlayerService.RF.AddPlayerPower:InvokeServer(unpack(args));
end

local function breakGlass()
    local args = {
        [1] = game:GetService("Players").LocalPlayer;
    }
    game:GetService("ReplicatedStorage").Knif.Knit.Services.PlayerService.RF.PlayerAttack:InvokeServer(unpack(args));
end
--------------------------------------------------------------------Ventana--------------------------------------------------------------------
local Window = Rayfield:CreateWindow({
    Name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    LoadingTitle = "Maplex Hub",
    LoadingSubtitle = "by Maplex",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Maplex Hub"
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

local Tab = Window:CreateTab("Main", 4483362458);

Tab:CreateSection("Auto break");

Tab:CreateToggle({
    Name = "Auto break",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(x)
        shared["AutoBreak"] = x
        while shared["AutoBreak"] do
            task.wait(0.1);
            breakGlass();
        end
    end,
})

Tab:CreateToggle({
    Name = "Auto gain power",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(x)
        shared["AddPower"] = x
        while shared["AddPower"] do
            task.wait(0.1);
            addPower();
        end
    end,
})