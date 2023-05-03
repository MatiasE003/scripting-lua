shared.hatch = false
shared.Silo = "MegaSilo2"

function Hatch()
	game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.Buy:InvokeServer(shared.Silo)
end

while shared.hatch do
    task.wait(0.1)
    Hatch()
end