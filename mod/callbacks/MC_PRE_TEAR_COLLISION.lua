--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____ghostshot = require("items.passive.ghostshot")
local ghostCollide = ____ghostshot.ghostCollide
function ____exports.preTearCollision(self, tear, collider, _low)
    ghostCollide(nil, tear, collider)
end
return ____exports
