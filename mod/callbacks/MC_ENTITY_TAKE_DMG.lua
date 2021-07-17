--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModEntityVariants = ____constants.ModEntityVariants
local ModItemTypes = ____constants.ModItemTypes
local ____peel = require("globals.peel")
local peelDmg = ____peel.peelDmg
local ____fatfetus = require("items.passive.fatfetus")
local glitterdrops = ____fatfetus.glitterdrops
function ____exports.entityTakeDamage(self, entity, amt, flags, src, _modPlayerData)
    if entity.Type == EntityType.ENTITY_PLAYER then
    end
    if Isaac.GetPlayer():HasCollectible(ModItemTypes.FAT_FETUS) then
        glitterdrops(nil, entity, amt, flags, src)
    end
    if entity.Type == ModEntityVariants.PEEL then
        peelDmg(nil, entity, amt)
    end
end
return ____exports
