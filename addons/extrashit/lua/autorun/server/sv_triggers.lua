hook.Add("EntityTakeDamage", "Spawn_Trigger", function(ent, dmgInfo)
    if dmgInfo:IsFallDamage() then return true end
    if !dmgInfo:GetAttacker():IsPlayer() or !ent:IsPlayer() then return end
    local vicPos = ent:GetPos()
    if vicPos.x > 639.968750 and vicPos.x < 1023.968750 and vicPos.y > -895.968750 and vicPos.y < 800.031250 and vicPos.z > -144 and vicPos.z < 64.031250 then
        dmgInfo:GetAttacker():SendLua("notification.AddLegacy('Fuck off', NOTIFY_ERROR, 15)")
        return true
    end
end)