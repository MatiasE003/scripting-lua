local CollectItemEntity = workspace.CollectItemEntity
local player = game.Players.LocalPlayer
local char = player.Character
local root = char.HumanoidRootPart
getgenv().andando = true

local function getEgg()
    for _,v in pairs(CollectItemEntity:GetChildren()) do
        root.CFrame = v.Item.CFrame
    end
end

while getgenv().andando do
    task.wait(0.5)
    if not getgenv().andando then
        break
    end
    getEgg()
end