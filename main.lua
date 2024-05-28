local GameId = game.PlaceId

local function ExecuteArsenal() -- Arsenal
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-script/main/Scripts/Autofarrm.lua"))()
end

local function ExecutePhantom() -- Phantom Forces
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-script/main/Z3US%20Phantom%20Forces"))()
end


local function ExecuteUniversal() -- Universal aimbot
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-script/main/Z3US%20Universal%20Aimbot.lua"))()
end

if GameId == 286090429 then
    ExecuteArsenal()
elseif GameId == 292439477 then
    ExecutePhantom()
else
    ExecuteUniversal()
end