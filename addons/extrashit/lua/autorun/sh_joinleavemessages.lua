if SERVER then
    util.AddNetworkString("plyName")

    hook.Add("PlayerInitialSpawn", "jckjoin", function(ply)
    net.Start("plyName")
        if ply:IsAdmin() then
            net.WriteString(ply:Nick() .. " (Staff Member)")
        else
            net.WriteString(ply:Nick())
        end
        net.Broadcast()
    end)

else
    net.Receive("plyName", function()
        chat.AddText(Color(255, 255, 255), "Player ", Color(255, 0, 0), net.ReadString(), Color(255, 255, 255), " has joined the game")
    end)
end