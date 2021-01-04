if SERVER then
    util.AddNetworkString("plyJoin")
    util.AddNetworkString("plyLeave")

    hook.Add("PlayerInitialSpawn", "jckjoin", function(ply)
    net.Start("plyJoin")
        if ply:IsAdmin() then
            net.WriteString(ply:Nick() .. " (Staff Member)")
        else
            net.WriteString(ply:Nick())
        end
        net.Broadcast()
    end)

    gameevent.Listen("player_disconnect")
    hook.Add("player_disconnect", "jckleave", function(data)

        local tblReasons =
        {
            ["Disconnect by user."]         = " has left the server",
            ["Too many warnings"]           = " reached the warning limit!",
            ["Connection closing"]          = " has lost connection",
            ["timed out"]                   = " has crashed out of the server",
            ["Client left game"]            = " left because of a Steam mishap.",
            ["[ULX] Kicked from server"]    = " has been kicked from the server",
            ["_default"]                    = " has left the server",
        }
        net.Start("plyLeave")
            net.WriteString(data.name)
            net.WriteString(tblReasons[data.reason])
        net.Broadcast()
    end)
else
    net.Receive("plyJoin", function()
        chat.AddText(Color(255, 255, 255), "Player ", Color(255, 0, 0), net.ReadString(), Color(255, 255, 255), " has joined the game")
    end)
    net.Receive("plyLeave", function()
        chat.AddText(Color(255, 255, 255), "Player ", Color(255, 0, 0), net.ReadString(), Color(255, 255, 255), net.ReadString())
    end)
end