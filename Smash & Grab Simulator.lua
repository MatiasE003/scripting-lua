local function addPower()
    local args = {
        [1] = game:GetService("Players").LocalPlayer
    }
    game:GetService("ReplicatedStorage").Knif.Knit.Services.PlayerService.RF.AddPlayerPower:InvokeServer(unpack(args))
end

local function breakGlass()


    local args = {
        [1] = game:GetService("Players").LocalPlayer
    }

    game:GetService("ReplicatedStorage").Knif.Knit.Services.PlayerService.RF.PlayerAttack:InvokeServer(unpack(args))

end

shared.addPower     = true
shared.breakGlass   = true
shared.tpPlayer     = true

while shared.breakGlass do
    task.wait(0.1)
    breakGlass()
end

while shared.addPower do
    task.wait(0.1)
    addPower()
end