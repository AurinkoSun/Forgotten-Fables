--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local game = ____constants.game
local ModItemTypes = ____constants.ModItemTypes
local ModPlayerTypes = ____constants.ModPlayerTypes
function ____exports.pocketItems(self, _modPlayerData)
    do
        local i = 0
        while i < Game():GetNumPlayers() do
            local player = game:GetPlayer(i)
            if player ~= nil then
                local ____switch5 = player:GetPlayerType()
                if ____switch5 == ModPlayerTypes.ALABASTER then
                    goto ____switch5_case_0
                end
                goto ____switch5_case_default
                ::____switch5_case_0::
                do
                    do
                        if not player:HasCollectible(ModItemTypes.GHOST_SHOT) then
                            player:AddCollectible(ModItemTypes.GHOST_SHOT)
                        end
                        if player:GetActiveItem(ActiveSlot.SLOT_POCKET) ~= ModItemTypes.BLOODDRIVE then
                            print("blood drive added!")
                            player:AddCollectible(ModItemTypes.BLOODDRIVE, nil, nil, ActiveSlot.SLOT_POCKET)
                        end
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
