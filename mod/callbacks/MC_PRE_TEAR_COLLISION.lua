--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____ghostshot = require("items.passive.ghostshot")
local ghostUpdate = ____ghostshot.ghostUpdate
function ____exports.preTearCollision(self, tear, collider, _low)
    ghostUpdate(nil, tear, collider)
end
return ____exports
