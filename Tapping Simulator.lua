local function Click()

    local args = {
    [1] = "Main"
    }

    game:GetService("ReplicatedStorage").Events.Tap:FireServer(unpack(args))

end

local function Rebirth(cantidad)

    local args = {
        [1] = cantidad
    }

    game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))

end

local Rebirths = {}

for i,v in next, game:GetService("Players").LocalPlayer.PlayerGui.UI.Rebirth.ScrollingContainer.ScrollingFrame:GetChildren() do
    if v:isA("TextButton") then
        local rebirth = v:FindFirstChild("Rebirth")
        rebirth = string.match(rebirth.Text, "(%d+)")
        if tonumber(rebirth) then
            table.insert(Rebirths, rebirth)
        end
    end
end

table.sort(Rebirths, function(a, b)
    return a < b
end)

local Huevos = {}

for i,v in next, game:GetService("Workspace").Shops:GetChildren() do
    if v:isA("Model") then
        table.insert(Huevos, v.Name)
    end
end

table.sort(Huevos, function(a, b)
    return a < b
end)

local function Hatch(nombre, cantidad)
 
    local args = {
        [1] = {},
        [2] = nombre,
        [3] = cantidad
    }

    game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))

end


local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Primer script",
    LoadingTitle = "Loading script",
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

local Tab = Window:CreateTab("Farming tab", 4483362458) -- Title, Image

Tab:CreateSection("Farming")

Tab:CreateToggle({
    Name = "Autoclick",
    CurrentValue = false,
    Flag = "Toggle1", 
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

Tab:CreateSection("Hatching")

Tab:CreateToggle({
    Name = "Auto Hatch",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(x)
        shared["Auto Hatch"] = x
        while shared["Auto Hatch"] do
            task.wait()
            if not shared["Auto Hatch"] then
                break
            end
            Hatch(shared.nombre, shared.cantidad)
        end
    end,
})

Tab:CreateToggle({
    Name = "Triple egg",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(x)
        if x == true then
            shared.cantidad = 3
        else
            shared.cantidad = 1
        end
    end,
})

Tab:CreateDropdown({
    Name = "Huevo",
    Options = Huevos,
    CurrentOption = Huevos[1],
    Flag = "Huevo", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
        shared.nombre = Option
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
            Rebirth(shared.rebirthAmount)
        end
    end,
})

Tab:CreateDropdown({
    Name = "Rebirth",
    Options = Rebirths,
    CurrentOption = Rebirths[1],
    Flag = "Huevo", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Option)
        shared.rebirthAmount = Option
    end,
})