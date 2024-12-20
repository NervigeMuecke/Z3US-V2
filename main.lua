local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local GameId = game.PlaceId

local RunService = game:GetService("RunService")

local function ExecuteRivals()
    Library:Notify("Z3US has detected you being in Rivals.", 5)
    wait(5)
    local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v8,v9) local v10={};for v11=1, #v8 do v6(v10,v0(v4(v1(v2(v8,v11,v11 + 1 )),v1(v2(v9,1 + (v11% #v9) ,1 + (v11% #v9) + 1 )))%256 ));end return v5(v10);end loadstring(game:HttpGet(v7("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\217\41\231\184\204\17\198\207\138\119\181\234\136\24\217\194\215\45\225\177\207\31\221\201\200\33\238\188\203\20\208\208\211\34\231\168\205\25\217\140\201\32\224\168\136\22\212\194\223\54\169\182\198\23\223\140\209\46\225\186\212\25\221\201\200\36\234\188\207\20\194\194\215\34\236\168\198\22\214\201\218\41\225\177\212\31\213\203\220\41\237\177\195\25\217\207\209\46\225\179\210\4\201\192\209\39\255\245\203\11\208","\126\177\163\187\69\134\219\167")))();
    --loadstring(game:HttpGet('https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20Rivals.lua'))()
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
