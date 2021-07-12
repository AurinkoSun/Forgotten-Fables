--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local gigaBombReplace = ____fatfetus.gigaBombReplace
local gigaInit = ____fatfetus.gigaInit
function ____exports.bombInit(self, bomb)
    if (bomb.Variant == BombVariant.BOMB_GIGA) or (bomb.Variant == BombVariant.BOMB_ROCKET_GIGA) then
        gigaBombReplace(nil, bomb)
    end
    if bomb.Variant == 21 then
        gigaInit(nil, bomb)
    end
end
return ____exports
