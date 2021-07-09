--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
local ghostReplace
function ghostReplace(self, tear, player)
    tear.Visible = false
    local ghost = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HUNGRY_SOUL, 0, tear.Position, tear.Velocity, player)
    return ghost
end
function ____exports.ghostShot(self, tear)
    if (tear.SpawnerEntity ~= nil) and (tear.SpawnerEntity.Type == EntityType.ENTITY_PLAYER) then
        local player = tear.SpawnerEntity:ToPlayer()
        if (player ~= nil) and player:HasCollectible(ModItemTypes.GHOST_SHOT) then
            ghostReplace(nil, tear, player)
        end
    end
end
return ____exports
