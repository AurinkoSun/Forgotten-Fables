--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local sfxManager = ____constants.sfxManager
function ____exports.rRoulette(self, rng, player)
    if rng:RandomInt(6) == 3 then
        player:TakeDamage(
            255,
            DamageFlag.DAMAGE_NO_MODIFIERS,
            EntityRef(player),
            0
        )
        sfxManager:Play(SoundEffect.SOUND_EXPLOSION_WEAK)
    else
        for ____, entity in ipairs(
            Isaac.GetRoomEntities()
        ) do
            if entity:IsVulnerableEnemy() then
                entity:Kill()
            end
        end
        sfxManager:Play(SoundEffect.SOUND_EXPLOSION_STRONG)
    end
    return true
end
return ____exports
