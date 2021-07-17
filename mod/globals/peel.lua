--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModEntityVariants = ____constants.ModEntityVariants
function ____exports.peelUpdate(self, npc)
    if npc.Variant == ModEntityVariants.PEEL then
        if npc.HitPoints <= (npc.MaxHitPoints / 2) then
            local ____obj, ____index = npc.Velocity, "X"
            ____obj[____index] = ____obj[____index] * 1.1
            local ____obj, ____index = npc.Velocity, "Y"
            ____obj[____index] = ____obj[____index] * 1.1
            Isaac.Spawn(
                EntityType.ENTITY_EFFECT,
                EffectVariant.CREEP_RED,
                0,
                npc.Position,
                Vector(0, 0),
                npc
            )
        end
    end
end
function ____exports.peelDmg(self, npc, damage)
    if npc.HitPoints <= ((npc.MaxHitPoints - damage) / 2) then
        npc:GetSprite():ReplaceSpritesheet(0, "../resources/gfx/monsters/Peel2.png")
        npc:GetSprite():LoadGraphics()
    end
end
return ____exports
