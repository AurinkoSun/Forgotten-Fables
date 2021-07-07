--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
local ____playerdata = require("playerdata")
local modPlayerData = ____playerdata.modPlayerData
local PlayerSeed = ____playerdata.PlayerSeed
function ____exports.sarahLostKill(self, tookDamage, amount, flags)
    local player = tookDamage:ToPlayer()
    if ((((player ~= nil) and (player:GetPlayerType() == constants.ModPlayerTypes.TAINTED_SARAH)) and modPlayerData[PlayerSeed(nil, player)]) and (amount ~= 0)) and (flags ~= DamageFlag.DAMAGE_NOKILL) then
        player:Kill()
        return false
    end
    return true
end
return ____exports
