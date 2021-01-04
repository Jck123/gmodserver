--//This file runs triggers depending on the map that is currently running//--

//if SHARED then
//    hook.Add("Initialize", "mapexec", function()
        --local file = "../mapexec/" .. game.GetMap() .. ".lua"
        --require file
        resource.AddFile("../mapexec/" .. game.GetMap() .. ".lua")
        --require("")
//    end)
//end