local idkbruh = {
    bringplayers = false
}

local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")
local LocalPlayer = game.Players.LocalPlayer

runService.RenderStepped:Connect(function()
    if idkbruh.bringplayers then 
        for _, v in workspace:FindFirstChild("Mobs"):GetChildren() do
            if (LocalPlayer.Character and LocalPlayer.Character:GetAttribute("Team") ~= -1) and (v:GetAttribute("Team") == LocalPlayer.Character:GetAttribute("Team")) then
                continue
            end
            local head = v:FindFirstChild("Head")
            if (not head) then
                continue
            end
            head.CFrame = camera.CFrame + camera.CFrame.lookVector * 7
        end
        for _, v in Players:GetPlayers() do
            if (v == LocalPlayer) then
                continue
            end
            if (LocalPlayer.Character and LocalPlayer.Character:GetAttribute("Team") ~= -1) and (v.Character and v.Character:GetAttribute("Team") == LocalPlayer.Character:GetAttribute("Team")) then
                continue
            end
            local head = v.Character and v.Character:FindFirstChild("Head")
            if (not head) then
                continue
            end
            head.CFrame = camera.CFrame + camera.CFrame.lookVector * 7
        end
    end
end)

return idkbruh
