--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local gigaUpdate = ____fatfetus.gigaUpdate
function ____exports.bombUpdate(self, bomb)
    if bomb.Variant == 21 then
        gigaUpdate(nil, bomb)
    end
end
return ____exports
