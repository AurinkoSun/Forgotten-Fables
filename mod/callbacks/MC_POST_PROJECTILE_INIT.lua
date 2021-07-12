--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local rocks = ____fatfetus.rocks
function ____exports.projectileInit(self, projectile)
    if projectile.Variant == ProjectileVariant.PROJECTILE_ROCK then
        rocks(nil, projectile)
    end
end
return ____exports
