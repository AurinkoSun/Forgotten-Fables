--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local constants = require("constants")
function ____exports.newFloor(self)
    local stage = constants.game:GetLevel():GetAbsoluteStage()
    if (stage / 2) == math.floor(stage / 2) then
        do
            local i = 0
            while i < constants.game:GetNumPlayers() do
                local player = constants.game:GetPlayer(i)
                if (player ~= nil) and (player:GetPlayerType() == constants.ModPlayerTypes.TAINTED_SARAH) then
                    player:AddBrokenHearts(-1)
                end
                i = i + 1
            end
        end
    end
end
return ____exports
