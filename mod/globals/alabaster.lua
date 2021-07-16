--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local game = ____constants.game
local ModPlayerTypes = ____constants.ModPlayerTypes
function ____exports.alabasterStats(self, player, flags)
    if player:GetPlayerType() == ModPlayerTypes.ALABASTER then
        if flags == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed - 0.15
        end
        if flags == CacheFlag.CACHE_FLYING then
            player.CanFly = true
        end
        game:GetLevel():AddAngelRoomChance(-100)
    end
end
function ____exports.alabasterHealth(self, player)
    if player:GetPlayerType() == ModPlayerTypes.ALABASTER then
        local playerHealth = player:GetMaxHearts()
        if playerHealth > 0 then
            player:AddMaxHearts(0 - playerHealth, false)
            player:AddBlackHearts(playerHealth)
        end
        local redHealth = player:GetHearts()
        if redHealth > 0 then
            player:AddHearts(0 - redHealth)
        end
    end
end
return ____exports
