--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModPlayerTypes = ____constants.ModPlayerTypes
function ____exports.bloodDrive(self, player, _modPlayerData)
    if player:GetPlayerType() == ModPlayerTypes.ALABASTER then
        print("hi")
    end
    return nil
end
function ____exports.alabasterHearts(self, pickup)
    if (pickup.Variant == PickupVariant.PICKUP_HEART) and (((pickup.SubType == HeartSubType.HEART_FULL) or (pickup.SubType == HeartSubType.HEART_HALF)) or (pickup.SubType == HeartSubType.HEART_DOUBLEPACK)) then
    end
end
return ____exports
