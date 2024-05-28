local PLAYER = game.Players.LocalPlayer
local CurrentCam = game.Workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local mouseLocation = UIS.GetMouseLocation
local mouse = PLAYER:GetMouse()

local DeleteMob = {
    ESP = {
        Box = {
            Enabled = false;
            Name = false;
            Distance = false;
            Health = false;
            Ping = false;
            Device = false; 
            TeamCheck = false;
            HealthType = "Bar";
            BoxColor = Color3.fromRGB(19, 0, 255);
        };
        OutLines = {
            Enabled = false;
            TeamCheck = false;
            TeamColor = false;
            AlwaysShow = true;
            FillColor = Color3.fromRGB(75, 0, 10);
            FillTransparency = 0;
            OutlineColor = Color3.fromRGB(0, 0, 0);
            OutlineTransparency = 0;
        };
        Tracers = {
            Enabled = false;
            TeamCheck = false;
            TeamColor = false;
            Color = Color3.fromRGB(19, 0, 255);
        }
    },
    Aimbot = {
        Enabled = false;
        TeamCheck = false;
        WallCheck = false;
        ShowFov = false;
        Fov = 150;
        Smoothing = 0.1;
        AimPart = "Head";
        Keybind = Enum.UserInputType.MouseButton2;
        Thickness = 1;
        FovFillColor = Color3.fromRGB(100, 0, 100);
        FovColor = Color3.fromRGB(19, 0, 255);
        FovFillTransparency = 1;
        FovTransparency = 0;
    },
    Triggerbot = {
        Enabled = false;
        TeamCheck = true;
        Delay = 0;
    },
    Player = {
        WalkSpeed = false;
        Fly = false;
        FlySpeedValue = 15;
        InfiniteJump = false;
        HoldJump = false;
        WalkSpeedValue = 16;
        Noclip = false;
        FireRate = false;
    },
    GunMods = {
        AlwaysAuto = false;
        NoSpread = false;
        NoRecoil = false;
    },
    Misc = {
        ChatSpammer = {
            Enabled = false;
            Message = "Hello, world!";
        }
    }
}

local ESPElements = {}
local AimbotFovCircle
local isTriggerbotFiring = false
local flyConnection
local walkSpeedConnection
local noclipConnection
local fireRateConnection
local gunModsConnection
local chatSpammerConnection
local originalGunValues = {}

local function SaveOriginalGunValues()
    for _, weapon in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
        if weapon:FindFirstChild("Auto") and weapon:FindFirstChild("Spread") and weapon:FindFirstChild("RecoilControl") then
            originalGunValues[weapon.Name] = {
                Auto = weapon.Auto.Value,
                Spread = weapon.Spread.Value,
                RecoilControl = weapon.RecoilControl.Value
            }
        end
    end
end

local function ApplyGunMods()
    for _, weapon in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
        if weapon:FindFirstChild("Auto") and weapon:FindFirstChild("Spread") and weapon:FindFirstChild("RecoilControl") then
            if DeleteMob.GunMods.AlwaysAuto then
                weapon.Auto.Value = true
            else
                weapon.Auto.Value = originalGunValues[weapon.Name].Auto
            end
            if DeleteMob.GunMods.NoSpread then
                weapon.Spread.Value = 0
            else
                weapon.Spread.Value = originalGunValues[weapon.Name].Spread
            end
            if DeleteMob.GunMods.NoRecoil then
                weapon.RecoilControl.Value = 0
            else
                weapon.RecoilControl.Value = originalGunValues[weapon.Name].RecoilControl
            end
        end
    end
end

ESPElements = {}

ESPElements = {}

local function CreateESP(plr)
    local elements = {}

    elements.box = Drawing.new("Square")
    elements.box.Visible = false
    elements.box.Color = DeleteMob.ESP.Box.BoxColor
    elements.box.Thickness = 1
    elements.box.Transparency = 1
    elements.box.Filled = false

    elements.tracer = Drawing.new("Line")
    elements.tracer.Visible = false
    elements.tracer.Color = DeleteMob.ESP.Tracers.Color
    elements.tracer.Thickness = 1
    elements.tracer.Transparency = 1

    elements.texts = {
        Name = Drawing.new("Text"),
        Distance = Drawing.new("Text"),
        Health = Drawing.new("Text"),
        Ping = Drawing.new("Text"),
        Device = Drawing.new("Text") 
    }

    for _, text in pairs(elements.texts) do
        text.Visible = false
        text.Color = DeleteMob.ESP.Box.BoxColor
        text.Size = 16
        text.Center = true
        text.Outline = true
    end

    ESPElements[plr] = elements
end

local function UpdateESP(plr, elements)
    local character = plr.Character
    if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") then
        if DeleteMob.ESP.Box.TeamCheck and plr.Team == PLAYER.Team then
            elements.box.Visible = false
            elements.tracer.Visible = false
            for _, text in pairs(elements.texts) do
                text.Visible = false
            end
            return
        end

        local humanoidRootPart = character.HumanoidRootPart
        local humanoid = character.Humanoid
        local hrpPosition, onScreen = CurrentCam:WorldToViewportPoint(humanoidRootPart.Position)

        if onScreen then
            local size = (CurrentCam:WorldToViewportPoint(humanoidRootPart.Position - Vector3.new(0, 3, 0)).Y - CurrentCam:WorldToViewportPoint(humanoidRootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
            local boxSize = Vector2.new(math.floor(size * 1.5), math.floor(size * 1.9))
            local boxPos = Vector2.new(math.floor(hrpPosition.X - boxSize.X / 2), math.floor(hrpPosition.Y - boxSize.Y / 2))

            if DeleteMob.ESP.Box.Enabled then
                elements.box.Size = boxSize
                elements.box.Position = boxPos
                elements.box.Visible = true
                elements.box.Color = DeleteMob.ESP.Box.BoxColor
            else
                elements.box.Visible = false
            end

            if DeleteMob.ESP.Tracers.Enabled then
                elements.tracer.From = Vector2.new(CurrentCam.ViewportSize.X / 2, CurrentCam.ViewportSize.Y)
                elements.tracer.To = Vector2.new(hrpPosition.X, hrpPosition.Y)
                elements.tracer.Visible = true
                elements.tracer.Color = DeleteMob.ESP.Box.BoxColor
            else
                elements.tracer.Visible = false
            end

            local offsetY = 0

            if DeleteMob.ESP.Box.Name then
                elements.texts.Name.Text = tostring(plr.Name)
                elements.texts.Name.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - boxSize.Y / 2 - 16 + offsetY)
                elements.texts.Name.Visible = true
                offsetY = offsetY + 15
            else
                elements.texts.Name.Visible = false
            end

            if DeleteMob.ESP.Box.Distance and PLAYER.Character and PLAYER.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (PLAYER.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude
                elements.texts.Distance.Text = string.format("Distance: %d", math.floor(distance))
                elements.texts.Distance.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - boxSize.Y / 2 - 16 + offsetY)
                elements.texts.Distance.Visible = true
                offsetY = offsetY + 15
            else
                elements.texts.Distance.Visible = false
            end

            if DeleteMob.ESP.Box.Health then
                elements.texts.Health.Text = string.format("Health: %d", math.floor(humanoid.Health))
                elements.texts.Health.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - boxSize.Y / 2 - 16 + offsetY)
                elements.texts.Health.Visible = true
                offsetY = offsetY + 15
            else
                elements.texts.Health.Visible = false
            end

            if DeleteMob.ESP.Ping then
                elements.texts.Ping.Text = string.format("Ping: %d", math.floor(plr.Ping.Value))
                elements.texts.Ping.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - boxSize.Y / 2 - 16 + offsetY)
                elements.texts.Ping.Visible = true
                offsetY = offsetY + 15
            else
                elements.texts.Ping.Visible = false
            end

            if DeleteMob.ESP.Device then
                elements.texts.Device.Text = string.format("Device: %s", tostring(plr.Status.InputDevice.Value))
                elements.texts.Device.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - boxSize.Y / 2 - 16 + offsetY)
                elements.texts.Device.Visible = true
                offsetY = offsetY + 15
            else
                elements.texts.Device.Visible = false
            end

            for _, text in pairs(elements.texts) do
                text.Color = DeleteMob.ESP.Box.BoxColor
            end
        else
            elements.box.Visible = false
            elements.tracer.Visible = false
            for _, text in pairs(elements.texts) do
                text.Visible = false
            end
        end
    else
        elements.box.Visible = false
        elements.tracer.Visible = false
        for _, text in pairs(elements.texts) do
            text.Visible = false
        end
    end
end

for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= PLAYER then
        CreateESP(player)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    if player ~= PLAYER then
        CreateESP(player)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    if ESPElements[player] then
        ESPElements[player].box:Remove()
        ESPElements[player].tracer:Remove()
        for _, text in pairs(ESPElements[player].texts) do
            text:Remove()
        end
        ESPElements[player] = nil
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    for player, elements in pairs(ESPElements) do
        if player ~= PLAYER then
            UpdateESP(player, elements)
        end
    end
end)


--------------------------

for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= PLAYER then
        CreateESP(player)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    if player ~= PLAYER then
        CreateESP(player)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    if ESPElements[player] then
        ESPElements[player].box:Remove()
        ESPElements[player].tracer:Remove()
        ESPElements[player].text:Remove()
        ESPElements[player] = nil
    end
end)

local function UpdateAimbotFovCircle()
    if not AimbotFovCircle then
        AimbotFovCircle = Drawing.new("Circle")
        AimbotFovCircle.Thickness = DeleteMob.Aimbot.Thickness
        AimbotFovCircle.Transparency = DeleteMob.Aimbot.FovFillTransparency
        AimbotFovCircle.Color = DeleteMob.Aimbot.FovColor
    end
    if DeleteMob.Aimbot.ShowFov then
        AimbotFovCircle.Visible = true
        AimbotFovCircle.Radius = DeleteMob.Aimbot.Fov
        AimbotFovCircle.Position = mouseLocation(UIS)
        AimbotFovCircle.Color = DeleteMob.Aimbot.FovColor -- Update color dynamically
    else
        AimbotFovCircle.Visible = false
    end
end

function isVisible(p, ...)
    if not (DeleteMob.Aimbot.WallCheck) then
        return true
    end
    return #CurrentCam:GetPartsObscuringTarget({ p }, { CurrentCam, PLAYER.Character, ... }) == 0 
end

function CameraGetClosestToMouse(Fov)
    local AimFov = Fov
    local targetPos = nil

    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= PLAYER then
            if DeleteMob.Aimbot.TeamCheck and v.Team == PLAYER.Team then
                continue
            end

            if v.Character and v.Character:FindFirstChild(DeleteMob.Aimbot.AimPart) and v.Character:FindFirstChildOfClass("Humanoid") and v.Character.Humanoid.Health > 0 then
                local screen_pos, on_screen = CurrentCam:WorldToViewportPoint(v.Character[DeleteMob.Aimbot.AimPart].Position)
                local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
                local new_magnitude = (screen_pos_2D - mouseLocation(UIS)).Magnitude
                if on_screen and new_magnitude < AimFov and isVisible(v.Character[DeleteMob.Aimbot.AimPart].Position, v.Character.Head.Parent) then
                    AimFov = new_magnitude
                    targetPos = v
                end
            end
        end
    end
    return targetPos
end

local function aimAt(pos, smooth)
    local AimPart = pos.Character:FindFirstChild(DeleteMob.Aimbot.AimPart)
    if AimPart then
        local LookAt = AimPart.Position
        CurrentCam.CFrame = CurrentCam.CFrame:Lerp(CFrame.lookAt(CurrentCam.CFrame.Position, LookAt), smooth)
    end
end

local function triggerbot()
    if DeleteMob.Triggerbot.Enabled then
        local target = mouse.Target
        if target and target.Parent and target.Parent:FindFirstChild("Humanoid") and target.Parent:FindFirstChild("HumanoidRootPart") then
            local player = game.Players:GetPlayerFromCharacter(target.Parent)
            if player and (not DeleteMob.Triggerbot.TeamCheck or (DeleteMob.Triggerbot.TeamCheck and player.Team ~= PLAYER.Team)) then
                while target and target.Parent and target.Parent:FindFirstChild("Humanoid") and target.Parent:FindFirstChild("HumanoidRootPart") and DeleteMob.Triggerbot.Enabled and mouse.Target == target do
                    if mouse.Target ~= target or not target.Parent.Humanoid or target.Parent.Humanoid.Health <= 0 then
                        break
                    end
                    mouse1press()
                    wait(DeleteMob.Triggerbot.Delay)
                    mouse1release()
                    wait(0.01)
                    target = mouse.Target
                end
            end
        end
    end
end

local function setWalkSpeed()
    local hrp = PLAYER.Character and PLAYER.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local bv = hrp:FindFirstChild("BodyVelocity")
        if not bv then
            bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.MaxForce = Vector3.new(100000, 0, 100000)
            bv.Parent = hrp
        end

        local moveDirection = Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + CurrentCam.CFrame.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - CurrentCam.CFrame.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - CurrentCam.CFrame.RightVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + CurrentCam.CFrame.RightVector
        end

        bv.Velocity = moveDirection * DeleteMob.Player.WalkSpeedValue
    end
end

local function startFly()
    if flyConnection then flyConnection:Disconnect() end
    local hrp = PLAYER.Character and PLAYER.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local fly = Instance.new("BodyVelocity")
        fly.Velocity = Vector3.new(0, 0, 0)
        fly.MaxForce = Vector3.new(100000, 100000, 100000)
        fly.Parent = hrp

        flyConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local moveDirection = Vector3.zero
            if UIS:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + CurrentCam.CFrame.LookVector
            end
            if UIS:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - CurrentCam.CFrame.LookVector
            end
            if UIS:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - CurrentCam.CFrame.RightVector
            end
            if UIS:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + CurrentCam.CFrame.RightVector
            end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + CurrentCam.CFrame.UpVector
            end
            if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
                moveDirection = moveDirection - CurrentCam.CFrame.UpVector
            end

            fly.Velocity = moveDirection * DeleteMob.Player.FlySpeedValue
            if moveDirection.Magnitude == 0 then
                fly.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    end
end

local function stopFly()
    if flyConnection then flyConnection:Disconnect() end
    local hrp = PLAYER.Character and PLAYER.Character:FindFirstChild("HumanoidRootPart")
    if hrp and hrp:FindFirstChildOfClass("BodyVelocity") then
        hrp:FindFirstChildOfClass("BodyVelocity"):Destroy()
    end
end

local function onJumpRequest()
    if DeleteMob.Player.InfiniteJump then
        local character = PLAYER.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end

local function holdJump()
    if DeleteMob.Player.HoldJump and UIS:IsKeyDown(Enum.KeyCode.Space) then
        local character = PLAYER.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end

local function noclip()
    if DeleteMob.Player.Noclip then
        for _, v in pairs(PLAYER.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v.CanCollide = false
            end
        end
    end
end

local function setFireRate(enabled)
    if enabled then
        fireRateConnection = game:GetService("RunService").RenderStepped:Connect(function()
            game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.DISABLED.Value = false
        end)
    else
        if fireRateConnection then
            fireRateConnection:Disconnect()
            fireRateConnection = nil
        end
    end
end

local function startChatSpammer()
    chatSpammerConnection = coroutine.wrap(function()
        while DeleteMob.Misc.ChatSpammer.Enabled do
            game.ReplicatedStorage.Events.PlayerChatted:FireServer("GRRR", DeleteMob.Misc.ChatSpammer.Message, false, false, true)
            wait(1.8)
        end
    end)
    chatSpammerConnection()
end

local function stopChatSpammer()
    DeleteMob.Misc.ChatSpammer.Enabled = false
end

UIS.JumpRequest:Connect(onJumpRequest)

game:GetService('RunService').RenderStepped:Connect(function()
    UpdateAimbotFovCircle() -- Always update the FOV circle, visibility is managed inside the function

    if DeleteMob.Aimbot.Enabled then 
        if UIS:IsMouseButtonPressed(DeleteMob.Aimbot.Keybind) then
            local _pos = CameraGetClosestToMouse(DeleteMob.Aimbot.Fov)
            if _pos then
                aimAt(_pos, DeleteMob.Aimbot.Smoothing)
            end
        end
    end 

    triggerbot()

    if DeleteMob.Player.WalkSpeed then
        setWalkSpeed()
    end

    if DeleteMob.Player.HoldJump then
        holdJump()
    end

    if DeleteMob.Player.Noclip then
        noclip()
    end

    if DeleteMob.GunMods.AlwaysAuto or DeleteMob.GunMods.NoSpread or DeleteMob.GunMods.NoRecoil then
        ApplyGunMods()
    end

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= PLAYER then
            if ESPElements[player] then
                UpdateESP(player, ESPElements[player])
            end
        end
    end
end)



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



local loadstring, getgenv, setclipboard, tablefind, UserInputService = loadstring, getgenv, setclipboard, table.find, game:GetService("UserInputService")

--// Environment

getgenv().AirHub = {}

--// Load Modules

loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Important/Aimbot%20Module%20Z3US%20V2.lua?token=GHSAT0AAAAAACH7S7PAABEUGWQIFYSU2QE2ZSV7B2A"))()

--// Variables

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)() -- Pepsi's UI Library
local Aimbot, WallHack = getgenv().AirHub.Aimbot, getgenv().AirHub.WallHack
local Parts, Fonts, TracersType = {"Head", "HumanoidRootPart"}, {"UI", "System", "Plex", "Monospace"}, {"Bottom", "Center", "Mouse"}

--// Frame

Library.UnloadCallback = function()
	Aimbot.Functions:Exit()
	WallHack.Functions:Exit()
	getgenv().AirHub = nil
end

local MainFrame = Library:CreateWindow({
	Name = "Z3US V2 (Arsenal)",
	Themeable = {
		Image = "7059346386",
		Info = "Made by NervigeMuecke",
		Credit = false
	},
	Background = "",
	Theme = [[{"__Designer.Colors.topGradient":"0C0073","__Designer.Settings.ShowHideKey":"Enum.KeyCode.RightShift","__Designer.Colors.section":"F3F2FF","__Designer.Colors.hoveredOptionBottom":"4819B4","__Designer.Background.ImageAssetID":"rbxassetid://4427304036","__Designer.Colors.selectedOption":"000BFF","__Designer.Colors.unselectedOption":"482271","__Designer.Files.WorkspaceFile":"Z3US","__Designer.Colors.unhoveredOptionTop":"310269","__Designer.Colors.outerBorder":"161616","__Designer.Background.ImageColor":"69009C","__Designer.Colors.tabText":"B9B9B9","__Designer.Colors.elementBorder":"00096F","__Designer.Colors.background":"250073","__Designer.Colors.sectionBackground":"000C57","__Designer.Background.ImageTransparency":100,"__Designer.Colors.bottomGradient":"0011E2","__Designer.Colors.otherElementText":"797EB9","__Designer.Colors.hoveredOptionTop":"6B10F9","__Designer.Colors.elementText":"C3C2FF","__Designer.Colors.main":"FFFFFF","__Designer.Colors.innerBorder":"3400FF","__Designer.Colors.unhoveredOptionBottom":"3E0088","__Designer.Background.UseBackgroundImage":false}]]
})

--// Tabs

local AimbotTab = MainFrame:CreateTab({
	Name = "Combat    "
})

local VisualsTab = MainFrame:CreateTab({
	Name = "Visuals    "
})

local WeaponsTab = MainFrame:CreateTab({
    Name = "Mods    "
})

local FunctionsTab = MainFrame:CreateTab({
	Name = "Misc    "
})

--// Aimbot Sections

local Values = AimbotTab:CreateSection({
	Name = "Aimbot"
})

local Checks = AimbotTab:CreateSection({
	Name = "Aimbot Checks",
    Side = "Right"
})

local Rage = AimbotTab:CreateSection({
	Name = "Rage",
})


local FOV_Values = AimbotTab:CreateSection({
	Name = "FOV Circle",
	Side = "Right"
})

local FOV_Appearance = AimbotTab:CreateSection({
	Name = "FOV Circle Settings",
	Side = "Right"
})

--// Visuals Sections

local WallHackChecks = VisualsTab:CreateSection({
	Name = "ESP Settings",
    Side = "Right"
})

local BoxesSettings = VisualsTab:CreateSection({
	Name = "ESP",
    Side = "Left"
})

--// Mods Sections

local Weaponsmods = WeaponsTab:CreateSection({
    Name = "Weapons mods",
    Side = "Left"
})

local Playermods = WeaponsTab:CreateSection({
    Name = "Player mods",
    Side = "Right"
})


--// Functions Sections

local FunctionsSection = FunctionsTab:CreateSection({
	Name = "Gui Functions"
})

local MiscSection = FunctionsTab:CreateSection({
	Name = "Misc",
    Side = "Right"
})

local ScriptsSection = FunctionsTab:CreateSection({
	Name = "Other scripts",
    Side = "Left"
})

--// Aimbot Values

Values:AddToggle({
	Name = "Enabled",
	Value = Aimbot.Settings.Enabled,
	Callback = function(New, Old)
		Aimbot.Settings.Enabled = New
	end
}).Default = Aimbot.Settings.Enabled

Values:AddToggle({
	Name = "Toggle",
	Value = Aimbot.Settings.Toggle,
	Callback = function(New, Old)
		Aimbot.Settings.Toggle = New
	end
}).Default = Aimbot.Settings.Toggle

Aimbot.Settings.LockPart = Parts[1]; Values:AddDropdown({
	Name = "Lock Part",
	Value = Parts[1],
	Callback = function(New, Old)
		Aimbot.Settings.LockPart = New
	end,
	List = Parts,
	Nothing = "Head"
}).Default = Parts[1]

Values:AddTextbox({ -- Using a Textbox instead of a Keybind because the UI Library doesn't support Mouse inputs like Left Click / Right Click...
	Name = "Hotkey",
	Value = Aimbot.Settings.TriggerKey,
	Callback = function(New, Old)
		Aimbot.Settings.TriggerKey = New
	end
}).Default = Aimbot.Settings.TriggerKey

--[[
Values:AddKeybind({
	Name = "Hotkey",
	Value = Aimbot.Settings.TriggerKey,
	Callback = function(New, Old)
		Aimbot.Settings.TriggerKey = stringmatch(tostring(New), "Enum%.[UserInputType]*[KeyCode]*%.(.+)")
	end,
}).Default = Aimbot.Settings.TriggerKey
]]

Values:AddSlider({
	Name = "Sensitivity",
	Value = Aimbot.Settings.Sensitivity,
	Callback = function(New, Old)
		Aimbot.Settings.Sensitivity = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Aimbot.Settings.Sensitivity

--// Aimbot Checks

Checks:AddToggle({
	Name = "Team Check",
	Value = Aimbot.Settings.TeamCheck,
	Callback = function(New, Old)
		Aimbot.Settings.TeamCheck = New
	end
}).Default = Aimbot.Settings.TeamCheck

Checks:AddToggle({
	Name = "Wall Check",
	Value = Aimbot.Settings.WallCheck,
	Callback = function(New, Old)
		Aimbot.Settings.WallCheck = New
	end
}).Default = Aimbot.Settings.WallCheck

--// FOV Settings Values

FOV_Values:AddToggle({
	Name = "Enabled",
	Value = Aimbot.FOVSettings.Enabled,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Enabled = New
	end
}).Default = Aimbot.FOVSettings.Enabled

FOV_Values:AddToggle({
	Name = "Visible",
	Value = Aimbot.FOVSettings.Visible,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Visible = New
	end
}).Default = Aimbot.FOVSettings.Visible

FOV_Values:AddSlider({
	Name = "Amount",
	Value = Aimbot.FOVSettings.Amount,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Amount = New
	end,
	Min = 10,
	Max = 1000
}).Default = Aimbot.FOVSettings.Amount


--//Rage

Rage:AddButton({
    Name = "Hitbox extender",
    Callback = function()
        function getplrsname()
            for i,v in pairs(game:GetChildren()) do
                if v.ClassName == "Players" then
                    return v.Name
                end
            end
        end
        local players = getplrsname()
        local plr = game[players].LocalPlayer
        coroutine.resume(coroutine.create(function()
            while  wait(1) do
                coroutine.resume(coroutine.create(function()
                    for _,v in pairs(game[players]:GetPlayers()) do
                        if v.Name ~= plr.Name and v.Character then
                            v.Character.RightUpperLeg.CanCollide = false
                            v.Character.RightUpperLeg.Transparency = 0.9
                            v.Character.RightUpperLeg.Size = Vector3.new(22,22,22)
                            
                            v.Character.LeftUpperLeg.CanCollide = false
                            v.Character.LeftUpperLeg.Transparency = 0.9
                            v.Character.LeftUpperLeg.Size = Vector3.new(22,22,22)
                            
                            v.Character.HeadHB.CanCollide = false
                            v.Character.HeadHB.Transparency = 0.9
                            v.Character.HeadHB.Size = Vector3.new(22,22,22)
                            
                            v.Character.HumanoidRootPart.CanCollide = false
                            v.Character.HumanoidRootPart.Transparency = 0.9
                            v.Character.HumanoidRootPart.Size = Vector3.new(22,22,22)
                        end
                    end
                end))
            end
        end))
    end,
})

-- kill all

Rage:AddButton({
    Name = "Kill all (toggle bind: T)",
    CurrentValue = false,
    Flag = "Kill all (toggle bind: T)",
    Callback = function(s)
        Rayfield:Notify({
			Title = "Z3US | Notification",
			Content = "Recommended with all gunmods on!",
			Duration = 20,
			Image = 11745872910,
			Actions = { -- Notification Buttons
				Ignore = {
					Name = "Close",
					Callback = function()
					end
				},
			},
		})
        -- Get required services and variables
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local Team = LocalPlayer.Team
        local TeamCheckEnabled = true -- Set to true to exclude teammates
        local TeleportDistance = 6 -- Initial teleport distance
        local Teleporting = false -- Variable to track if teleporting is active
        local Initialized = false -- Flag to track if the script has been initialized

        -- Function to check if a player is an enemy
        local function isEnemy(player)
            return TeamCheckEnabled and player.Team ~= Team
        end

        -- Function to find the nearest enemy
        local function findNearestEnemy()
            local nearestEnemy = nil
            local nearestDistance = math.huge

            -- Loop through all players
            for _, player in ipairs(Players:GetPlayers()) do
                -- Check if the player is an enemy and alive
                if isEnemy(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    -- Calculate distance between local player and enemy
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude

                    -- Update nearest enemy if closer than previous
                    if distance < nearestDistance then
                        nearestEnemy = player
                        nearestDistance = distance
                    end
                end
            end

            return nearestEnemy, nearestDistance
        end

        -- Function to teleport behind the nearest enemy
        local function teleportBehindEnemy()
            local enemy, distance = findNearestEnemy()

            if enemy then
                -- Calculate teleportation destination behind enemy and above their head
                local enemyPosition = enemy.Character.HumanoidRootPart.Position
                local direction = (LocalPlayer.Character.HumanoidRootPart.Position - enemyPosition).unit
                local teleportDestination = enemyPosition + direction * TeleportDistance + Vector3.new(0, 0, 0) -- Teleport 10 studs above the enemy

                -- Teleport local player closer if the distance is less than TeleportDistance
                if distance < TeleportDistance then
                    LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(enemyPosition))
                else
                    LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(teleportDestination))
                end
            else
                print("No enemy found.")
            end
        end

        -- Function to handle key press to toggle teleporting
        local function onKeyPress(key)
            if key.KeyCode == Enum.KeyCode.T then
                -- Toggle teleporting status
                Teleporting = not Teleporting
                -- If teleporting is active, start continuous teleportation
                if Teleporting then
                    while Teleporting do
                        teleportBehindEnemy()
                        wait()
                    end
                end
            end
        end

        -- Connect key press event
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            -- Check if the key pressed is "T"
            if input.KeyCode == Enum.KeyCode.T then
                onKeyPress(input)
            end
        end)

        -- Set the script as initialized
        Initialized = true
    end
})

--// FOV Settings Appearance

FOV_Appearance:AddColorpicker({
	Name = "Color",
	Value = Aimbot.FOVSettings.Color,
	Callback = function(New, Old)
		Aimbot.FOVSettings.Color = New
	end
}).Default = Aimbot.FOVSettings.Color

FOV_Appearance:AddColorpicker({
	Name = "Locked Color",
	Value = Aimbot.FOVSettings.LockedColor,
	Callback = function(New, Old)
		Aimbot.FOVSettings.LockedColor = New
	end
}).Default = Aimbot.FOVSettings.LockedColor

--// Wall Hack Settings

WallHackChecks:AddToggle({
	Name = "Team Check",
    Value = false,
    Callback = function(Value)
        DeleteMob.ESP.Box.TeamCheck = Value  
    end,
})

WallHackChecks:AddColorpicker({
	Name = "Color",
    Color = DeleteMob.ESP.Box.BoxColor,
    Callback = function(Value)
        DeleteMob.ESP.Box.BoxColor = Value
        DeleteMob.ESP.Tracers.Color = Value -- Update tracer color dynamically
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= PLAYER and ESPElements[player] then
                ESPElements[player].box.Color = Value
                ESPElements[player].tracer.Color = Value
                ESPElements[player].text.Color = Value
            end
        end
    end,
})

--// Visuals Settings

BoxesSettings:AddToggle({
    Name = "Box ESP",
    Value = false,
    Callback = function(Value)
        DeleteMob.ESP.Box.Enabled = Value
    end,
})

BoxesSettings:AddToggle({
    Name = "Name ESP",
    Value = false,
    Callback = function(Value)
        DeleteMob.ESP.Box.Name = Value
    end,
})

BoxesSettings:AddToggle({
    Name = "Ping ESP",
    Value = false,
    Callback = function(Value)
        DeleteMob.ESP.Ping = Value
    end,
})

BoxesSettings:AddToggle({
    Name = "Device ESP",
    Value = false,
    Callback = function(Value)
        DeleteMob.ESP.Device = Value
    end,
})

BoxesSettings:AddToggle({
	Name = "Tracers",
    Value = false,
    Callback = function(Value)
        DeleteMob.ESP.Tracers.Enabled = Value
    end,
})


--// Mods

Playermods:AddToggle({
    Name = "CFrame Fly",
    Value = false,
    Callback = function(Value)
        DeleteMob.Player.Fly = Value
        if Value then
            startFly()
        else
            stopFly()
        end
    end,
})

Playermods:AddSlider({
    Name = "Fly Speed",
    Min = 5,
	Max = 100,
    Value = DeleteMob.Player.FlySpeedValue,
    Callback = function(Value)
        DeleteMob.Player.FlySpeedValue = Value
    end,
})

Playermods:AddToggle({
    Name = "WalkSpeed",
    Value = false,
    Callback = function(Value)
        DeleteMob.Player.WalkSpeed = Value
        if Value then
            setWalkSpeed()
            walkSpeedConnection = game:GetService("RunService").RenderStepped:Connect(setWalkSpeed)
        elseif walkSpeedConnection then
            walkSpeedConnection:Disconnect()
            walkSpeedConnection = nil
        end
    end,
})

Playermods:AddSlider({
    Name = "Set WalkSpeed",
    Value = DeleteMob.Player.WalkSpeedValue,
    Min = 0,
	Max = 100,
    Callback = function(Value)
        DeleteMob.Player.WalkSpeedValue = Value
    end,
})

Playermods:AddToggle({
    Name = "Infinite Jump",
    Value = false,
    Callback = function(Value)
        DeleteMob.Player.InfiniteJump = Value
    end,
})

Playermods:AddToggle({
    Name = "Hold Space to Keep Jumping",
    Value = false,
    Callback = function(Value)
        DeleteMob.Player.HoldJump = Value
    end,
})

Playermods:AddToggle({
    Name = "Noclip",
    Value = false,
    Callback = function(Value)
        DeleteMob.Player.Noclip = Value
        if Value then
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                for _, v in pairs(PLAYER.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            for _, v in pairs(PLAYER.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = true
                end
            end
        end
    end,
})

Weaponsmods:AddToggle({
    Name = "Rapid Fire",
    Value = false,
    Callback = function(Value)
        DeleteMob.Player.FireRate = Value
        setFireRate(Value)
    end,
})

Weaponsmods:AddToggle({
    Name = "Always Auto",
    Value = false,
    Callback = function(Value)
        DeleteMob.GunMods.AlwaysAuto = Value
        ApplyGunMods()
    end,
})

Weaponsmods:AddToggle({
    Name = "No Spread",
    Value = false,
    Callback = function(Value)
        DeleteMob.GunMods.NoSpread = Value
        ApplyGunMods()
    end,
})

Weaponsmods:AddToggle({
    Name = "No Recoil",
    Value = false,
    Callback = function(Value)
        DeleteMob.GunMods.NoRecoil = Value
        ApplyGunMods()
    end,
})

Weaponsmods:AddButton({
    Name = "Infinite Ammo",
    Callback = function()
        local Holder = Instance.new("Folder", game.CoreGui)
        Holder.Name = "Infinite Ammo"

        while wait() do
            local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
            if playerGui.GUI.Client.Variables.ammocount then
                playerGui.GUI.Client.Variables.ammocount.Value = 999
            end
            if playerGui.GUI.Client.Variables.ammocount2 then
                playerGui.GUI.Client.Variables.ammocount2.Value = 999
            end
        end
    end
})

Weaponsmods:AddButton({
    Name = "Rainbow Gun",
    Callback = function()
        local Holder = Instance.new("Folder", game.CoreGui)
        Holder.Name = "Rainbow Gun"

        local c = 1
        function zigzag(X)
            return math.acos(math.cos(X * math.pi)) / math.pi
        end
        
        game:GetService("RunService").RenderStepped:Connect(function()
            if game.Workspace.CurrentCamera:FindFirstChild('Arms') then
                for i,v in pairs(game.Workspace.CurrentCamera.Arms:GetDescendants()) do
                    if v:IsA('MeshPart') then
                        v.Color = Color3.fromHSV(zigzag(c), 1, 1)
                        c = c + .0001
                    end
                end
            end
        end)
    end
})

--// Functions

FunctionsSection:AddButton({
	Name = "Reset Settings",
	Callback = function()
		Aimbot.Functions:ResetSettings()
		WallHack.Functions:ResetSettings()
		Library.ResetAll()
	end
})

FunctionsSection:AddButton({
	Name = "Restart",
	Callback = function()
		Aimbot.Functions:Restart()
		WallHack.Functions:Restart()
	end
})

FunctionsSection:AddButton({
	Name = "Exit",
	Callback = Library.Unload,
})

MiscSection:AddLabel({
    Name = "break the injection function",
})

MiscSection:AddButton({
    Name = "Rejoin",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        TeleportService:Teleport(PlaceId, PLAYER)
    end,
})

ScriptsSection:AddButton({
    Name = "Melee Hub (not by me!)",
    Callback = function()
        local Holder = Instance.new("Folder", game.CoreGui)
        Holder.Name = "Melee Hub (not by me!)"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/D8rkX/D8rk-Hub/main/Arsenal%20Scripts/Hubs-Extras/Melee%20Hub%20V1.lua", true))()
    end,
})

