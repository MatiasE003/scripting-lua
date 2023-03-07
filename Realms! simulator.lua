shared.rat = true
while shared.rat == true do
    task.wait()
    local A_1 = "PETIDDD"-- PET ID
    local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.1.0-rc.1"].knit.Services.PetsService["__comm__"].RE.AttackTarget
    Event:FireServer(A_1)
end

shared.KillAuraEnabled = true

while task.wait(0.2) do
  if shared.KillAuraEnabled == true then
      for i, v in ipairs(game:GetService("Workspace").RENDER.ENTITIES:GetDescendants()) do
          if v.Name == "Bar" then
              local enemy = v.Parent.Parent.Parent.Name
              local arg2 = enemy
              local Event = game:GetService("ReplicatedStorage").Packages["_Index"]["sleitnick_knit@1.1.0-rc.1"].knit.Services.PetsService["__comm__"].RF.SelectTarget
              Event:InvokeServer(arg2)
          end
      end
      for x, h in pairs(game:GetService("Workspace").DROPS:GetDescendants()) do
          if h.ClassName == "Part" then
              h.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
          end
      end
  end
end