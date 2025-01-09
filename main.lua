local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local GameId = game.PlaceId

local RunService = game:GetService("RunService")

local function ExecuteRivals()
    Library:Notify("Z3US has detected you being in Rivals.", 5)
    wait(5)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/refs/heads/main/Games/Zypherion%20Rivals%20Beta.lua'))()
end

local function ExecuteFootball()
    Library:Notify("Z3US has detected you being in a Touch Football.", 5)
    wait(5)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Touch%20Football%20Z3US.lua'))()
end

local function ExecuteArsenal()
    Library:Notify("Z3US has detected you being in Arsenal.", 5)
    wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/refs/heads/main/Games/Loader%20Arsenal.lua"))()
end

local function ExecuteFront()
    Library:Notify("Z3US has detected you being in Frontlines.", 5)
    wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/refs/heads/main/Games/Z3US%20Frontlines"))()
end

local function ExecuteUniversal()
    Library:Notify("You are not in a supported game, loading universal..", 5)
    wait(5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/refs/heads/main/Games/Z3US%20Universal.lua"))()
end


local function ExecuteGame()
    if GameId == 16447934574 then 
        ExecuteFootball()
    elseif GameId == 286090429 then
        ExecuteArsenal()
    elseif GameId == 17625359962 or GameId == 71874690745115  then
        ExecuteRivals()
    elseif GameId == 5938036553 then
        ExecuteFront()
    else
        ExecuteUniversal()
    end
end

ExecuteGame()
wait(0.5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/refs/heads/main/idkbruh.lua"))()
