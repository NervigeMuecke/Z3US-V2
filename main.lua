local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()

local Repository = "https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/"

local SupportedGames = {
    [17625359962] = Repository .. "Z3US%20Rivals.lua",    -- Rivals
    [286090429] = Repository .. "Z3US%20V2.5%20ARSENAL",    -- Arsenal
    [5938036553] = Repository .. "Z3US%20Frontlines%20V1.0.0", -- Frontlines
}

local Game = SupportedGames[game.PlaceId]

if not Game then
    Library:Notify("You are not in a supported game, loading universal..")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NervigeMuecke/Z3US-V2/main/Games/Z3US%20UNIVERSAL%20BETA%20V2.2"))()
end

loadstring(game:HttpGet(Game))()
