local GameId = game.PlaceId

local function ExecuteFootball() -- Touch Football
    loadstring(game:HttpGet('https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Touch%20Football%20Z3US.lua'))()
end

local function ExecuteArsenal() -- Arsenal
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20V2.2%20ARSENAL"))()
end

local function ExecutePhantom() -- Phantom Forces
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20Phantom%20Forces"))()
end

local function ExecuteFront() -- Frontlines 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20Frontlines%20V1.0.0"))()
end

local function ExecuteUniversal() -- Universal aimbot
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20V2.1%20UNIVERSAL"))()
end


if GameId == 16447934574 then 
    ExecuteFootball()
elseif GameId == 286090429 then
    ExecuteArsenal()
elseif GameId == 292439477 then
    ExecutePhantom()
elseif GameId == 5938036553 then
    ExecuteFront()
else
    ExecuteUniversal()
end
