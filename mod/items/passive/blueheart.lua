--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local game = ____constants.game
local ModItemTypes = ____constants.ModItemTypes
function ____exports.blueHeart(self, pos)
    local numBlueHearts = 0
    do
        local i = 0
        while i < game:GetNumPlayers() do
            local player = game:GetPlayer(i)
            if (player ~= nil) and player:HasCollectible(ModItemTypes.BLUE_HEART) then
                numBlueHearts = numBlueHearts + 1
            end
            i = i + 1
        end
    end
    if Game():GetRoom():GetType() == RoomType.ROOM_BOSS then
        do
            local i = 0
            while i < (numBlueHearts * 3) do
                Isaac.Spawn(
                    EntityType.ENTITY_PICKUP,
                    PickupVariant.PICKUP_HEART,
                    HeartSubType.HEART_SOUL,
                    Game():GetRoom():FindFreePickupSpawnPosition(pos),
                    Vector(0, 0),
                    nil
                )
                i = i + 1
            end
        end
    end
end
return ____exports
