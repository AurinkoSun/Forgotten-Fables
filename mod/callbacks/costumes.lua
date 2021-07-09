--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
function ____exports.costumes(self, _modPlayerData)
    do
        local i = 0
        while i < constants.game:GetNumPlayers() do
            local player = Isaac.GetPlayer(i)
            if player ~= nil then
                local ____switch5 = player:GetPlayerType()
                if ____switch5 == constants.ModPlayerTypes.ALABASTER then
                    goto ____switch5_case_0
                end
                goto ____switch5_case_default
                ::____switch5_case_0::
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
