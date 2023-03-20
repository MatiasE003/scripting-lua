local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Maplexito Hub",
    LoadingTitle = "Maplexito Hub",
    LoadingSubtitle = "by Maplex",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Maplex Games",
       FileName = "Maplexito Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = "Hello"
    }
})

local Tab = Window:CreateTab("Main", 4483362458)

local Section = Tab:CreateSection("Farm")

Tab:CreateToggle({
    Name = "",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(x)
        
    end,
})

Tab:CreateToggle({
    Name = "",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(x)
        
    end,
})

Tab:CreateToggle({
    Name = "",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(x)
        
    end,
})