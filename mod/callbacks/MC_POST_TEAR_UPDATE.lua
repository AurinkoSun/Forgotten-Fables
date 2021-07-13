--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModTearVariants = ____constants.ModTearVariants
local ____ghostshot = require("items.passive.ghostshot")
local ghostUpdate = ____ghostshot.ghostUpdate
function ____exports.tearUpdate(self, tear)
    if tear.Variant == ModTearVariants.GHOST then
        ghostUpdate(nil, tear)
    end
end
return ____exports
