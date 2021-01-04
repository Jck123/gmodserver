--//This file runs code depending on the map that is currently running//--

if SHARED then
    hook.Add("Initialize", "mapexec", function()
        require("../mapexec/" .. game.GetMap() .. ".lua")
    end)
end