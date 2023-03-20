local function Farm()


    local args = {
        [1] = 4,
        [2] = 1
    }

    game:GetService("ReplicatedStorage").Remotes.Data:FireServer(unpack(args))

end

shared["farm"] = true

while shared["farm"] do
    task.wait(0.01)
    Farm()
end