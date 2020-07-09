hook.Add("OnPlayerChat", "jckChattags", function(ply, text)
    if !ply:IsValid() then
        chat.AddText(Color(0,0,255), "[Server]: ", Color(255, 255, 255), text)
        return true
    elseif ply:SteamID() == "STEAM_0:1:56196170" then
        chat.AddText(Color(255,0,0), "[Owner] ", Color(255, 255, 255), ply:Nick() .. ": " .. text)
        return true
    else
        chat.AddText(Color(0,0,255), "[User]", Color(255, 255, 255), ply:Nick() .. ": " .. text)
        return true
    end
end)

hook.Add("PlayerInitialSpawn", "jckJoin", function(ply)
    chat.AddText(Color(255, 255, 255), "User ", Color(0,0,255), ply:Nick(), Color(255, 255, 255), " has joined the server!")
end)

//Hides default leave message (Totally not stolen from the wiki...)
hook.Add("ChatText","hide_joinleave",function(index,name,text,typ)
    if (typ == "joinleave") then return true end
end )