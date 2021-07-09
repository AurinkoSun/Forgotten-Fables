--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
local ____playerdata = require("playerdata")
local GetPlayerId = ____playerdata.GetPlayerId
function ____exports.costumes(self, modPlayerData)
    do
        local i = 0
        while i < constants.game:GetNumPlayers() do
            local player = Isaac.GetPlayer(i)
            if player ~= nil then
                if player:GetPlayerType() == constants.ModPlayerTypes.SARAH then
                    player:TryRemoveNullCostume(constants.ModCostumes.SARAH_HAIR)
                    player:AddNullCostume(constants.ModCostumes.SARAH_HAIR)
                    player:GetData().costumeEquipped = true
                end
                if player:GetPlayerType() == constants.ModPlayerTypes.TAINTED_SARAH then
                    if modPlayerData.data[GetPlayerId(nil, player) + 1].lost then
                        player:TryRemoveNullCostume(constants.ModCostumes.LOST_SARAH_HAIR)
                        player:AddNullCostume(constants.ModCostumes.LOST_SARAH_HAIR)
                    else
                        player:TryRemoveNullCostume(constants.ModCostumes.LOST_SARAH_HAIR)
                        player:AddNullCostume(constants.ModCostumes.LOST_SARAH_HAIR)
                    end
                    player:GetData().costumeEquipped = true
                end
            end
            i = i + 1
        end
    end
end
return ____exports
