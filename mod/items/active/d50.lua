--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.d50(self, _item, rng, player, slot, _modPlayerData)
    local charges = player:GetActiveCharge(slot)
    local random = rng:RandomInt(10)
    if charges >= random then
    else
    end
    return true
end
return ____exports
