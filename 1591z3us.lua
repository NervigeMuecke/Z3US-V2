local function warummacheichdas()
    local playersClient = game:FindFirstChild("Players - Client")
    if playersClient then
        playersClient.Name = "Players"
    end

    local workspaceClient = game:FindFirstChild("Workspace - Client")
    if workspaceClient then
        workspaceClient.Name = "Workspace"
    end
end

warummacheichdas()
wait(1)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local GameId = game.PlaceId

local RunService = game:GetService("RunService")

local player =  game.Players.LocalPlayer
local accage = player.AccountAge
local age = 1000

if accage > age then
    player:Kick("You got detected using a main acc, I don't support cheating on main accs. Use an alt >:(")
end

local function ExecuteRivals()
    Library:Notify("Z3US has detected you being in Rivals.", 5)
    wait(5)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20Rivals.lua'))()
end

local function ExecuteFootball()
    Library:Notify("Z3US has detected you being in a Touch Football.", 5)
    wait(5)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Touch%20Football%20Z3US.lua'))()
end

local function ExecuteArsenal()
    Library:Notify("Z3US has detected you being in Arsenal.", 5)
    wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/refs/heads/main/Games/Z3US%20Arsenal%20V3.lua"))()
end

local function ExecuteFront()
    Library:Notify("Z3US has detected you being in Frontlines.", 5)
    wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20Frontlines%20V1.0.0"))()
end

local function ExecuteUniversal()
    Library:Notify("You are not in a supported game, loading universal..", 5)
    wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20UNIVERSAL%20BETA%20V2.2"))()
end


local function ExecuteGame()
    if GameId == 16447934574 then 
        ExecuteFootball()
    elseif GameId == 286090429 then
        ExecuteArsenal()
    elseif GameId == 5938036553 then
        ExecuteFront()
    elseif GameId == 17625359962 or 6035872082  then
        ExecuteRivals()
    else
        ExecuteUniversal()
    end
end
wait(1)
ExecuteGame()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/refs/heads/main/idkbruh.lua"))()
