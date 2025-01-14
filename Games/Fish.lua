local player = game:GetService("Players").LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.4
frame.BorderSizePixel = 0
frame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 400, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Z3US | Fisch Coin Giver"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextSize = 25
title.Font = Enum.Font.GothamBold
title.TextStrokeTransparency = 0.5
title.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = title

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 200, 0, 40)
button2.Position = UDim2.new(0.5, -100, 0.4, -20)
button2.Text = "FE Coin Spawner"
button2.BackgroundColor3 = Color3.fromRGB(100, 255, 255)
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.TextSize = 15
button2.Font = Enum.Font.Gotham
button2.TextStrokeTransparency = 0.5
button2.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 200, 0, 20)
label.Position = UDim2.new(0.5, -100, 0.5, -10)
label.Text = "(Recommended with Anti-Lag)"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.BackgroundTransparency = 1
label.TextSize = 12
label.Font = Enum.Font.Gotham
label.TextStrokeTransparency = 0.5
label.Parent = frame

local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0, 200, 0, 40)
button3.Position = UDim2.new(0.5, -100, 0.7, -20)
button3.Text = "Anti-Lag"
button3.BackgroundColor3 = Color3.fromRGB(85, 85, 255)
button3.TextColor3 = Color3.fromRGB(255, 255, 255)
button3.TextSize = 15
button3.Font = Enum.Font.Gotham
button3.TextStrokeTransparency = 0.5
button3.Parent = frame

local corner2 = Instance.new("UICorner")
corner2.CornerRadius = UDim.new(0, 8)
corner2.Parent = button2

local corner3 = Instance.new("UICorner")
corner3.CornerRadius = UDim.new(0, 8)
corner3.Parent = button3

local userInputService = game:GetService("UserInputService")

local function toggleVisibility()
    frame.Visible = not frame.Visible
end

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Insert or input.KeyCode == Enum.KeyCode.RightShift then
        toggleVisibility()
    end
end)

button2.MouseButton1Click:Connect(function()
    game:GetService('RunService').Stepped:Connect(function()
        for i = 1, 50 do
            game:GetService("ReplicatedStorage").packages.Net["RE/DailyReward/Claim"]:FireServer()
        end
    end)

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Stackable";
        Text = "You can execute this multiple times, anti-lag is recommended so the messages stop.";
        Duration = 5;
    })
end)

button3.MouseButton1Click:Connect(function()
    local hud = player.PlayerGui:WaitForChild("hud")
    local announcements = hud.safezone:FindFirstChild("announcements")
    if announcements then
        announcements:Destroy()
    end
end)
