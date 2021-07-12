--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local glitterdrops = ____fatfetus.glitterdrops
function ____exports.entityTakeDamage(self, entity, amt, flags, src, _modPlayerData)
    if entity.Type == EntityType.ENTITY_PLAYER then
    end
    glitterdrops(nil, entity, amt, flags, src)
end
return ____exports
