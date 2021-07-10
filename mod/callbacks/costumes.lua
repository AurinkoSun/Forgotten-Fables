--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
function ____exports.costumes(self, _modPlayerData)
    do
        local i = 0
        while i < 8 do
            local player = Isaac.GetPlayer(i)
            if player ~= nil then
                if player:GetPlayerType() == Isaac.GetPlayerTypeByName("Alabaster") then
                    player:TryRemoveNullCostume(constants.ModCostumes.ALABASTER_HAIR)
                    player:AddNullCostume(constants.ModCostumes.ALABASTER_HAIR)
                    player:GetData().costumeEquipped = true
                end
            end
            i = i + 1
        end
    end
end
return ____exports
