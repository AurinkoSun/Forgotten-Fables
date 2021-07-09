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
                local ____switch5 = player:GetPlayerType()
                if ____switch5 == constants.ModPlayerTypes.SARAH then
                    goto ____switch5_case_0
                elseif ____switch5 == constants.ModPlayerTypes.TAINTED_SARAH then
                    goto ____switch5_case_1
                elseif ____switch5 == constants.ModPlayerTypes.ALABASTER then
                    goto ____switch5_case_2
                end
                goto ____switch5_case_default
                ::____switch5_case_0::
                do
                    do
                        player:TryRemoveNullCostume(constants.ModCostumes.SARAH_HAIR)
                        player:AddNullCostume(constants.ModCostumes.SARAH_HAIR)
                        player:GetData().costumeEquipped = true
                        goto ____switch5_end
                    end
                end
                ::____switch5_case_1::
                do
                    do
                        if modPlayerData.data[GetPlayerId(nil, player) + 1].lost then
                            player:TryRemoveNullCostume(constants.ModCostumes.LOST_SARAH_HAIR)
                            player:AddNullCostume(constants.ModCostumes.LOST_SARAH_HAIR)
                        else
                            player:TryRemoveNullCostume(constants.ModCostumes.LOST_SARAH_HAIR)
                            player:AddNullCostume(constants.ModCostumes.LOST_SARAH_HAIR)
                        end
                        player:GetData().costumeEquipped = true
                        goto ____switch5_end
                    end
                end
                ::____switch5_case_2::
                do
                    do
                        player:TryRemoveNullCostume(constants.ModCostumes.ALABASTER_HAIR)
                        player:AddNullCostume(constants.ModCostumes.ALABASTER_HAIR)
                        player:GetData().costumeEquipped = true
                        goto ____switch5_end
                    end
                end
                ::____switch5_case_default::
                do
                    do
                        goto ____switch5_end
                    end
                end
                ::____switch5_end::
            end
            i = i + 1
        end
    end
end
return ____exports
