--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____fatfetus = require("items.passive.fatfetus")
local fatFetusTears = ____fatfetus.fatFetusTears
local ____ghostshot = require("items.passive.ghostshot")
local ghostShot = ____ghostshot.ghostShot
function ____exports.postFireTear(self, tear)
    fatFetusTears(nil, tear)
    ghostShot(nil, tear)
end
return ____exports
