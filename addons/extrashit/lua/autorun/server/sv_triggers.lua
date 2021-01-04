trigger = {}

function trigger.Create(startVec, endVec, name)

    if startVec.x > endVec.x or startVec.y > endVec.y or startVec.z > startVec.z then return error("[ERROR] All startVec values MUST be smaller than endVec values!") end

    hook.Add("EntityTakeDamage", "trigger_" .. name, function(ent, dmgInfo)
        if dmgInfo:IsFallDamage() then return true end
        if !dmgInfo:GetAttacker():IsPlayer() or !ent:IsPlayer() then return end
        local vicPos = ent:GetPos()
        if vicPos.x > startVec.x and vicPos.x < endVec.x and vicPos.y > startVec.y and vicPos.y < endVec.y and vicPos.z > startVec.z and vicPos.z < endVec.z then
            --TODO: Remove SendLua() function
            dmgInfo:GetAttacker():SendLua("notification.AddLegacy('Fuck off', NOTIFY_ERROR, 15)")
            return true
        end
    end)
end

function trigger.Remove(name)
    hook.Remove("EntityTakeDamage", "trigger_" .. name)
end