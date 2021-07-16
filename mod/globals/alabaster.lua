--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants")
local ModPlayerTypes = ____constants.ModPlayerTypes
function ____exports.alabasterStats(self, player, flags)
    if player:GetPlayerType() == ModPlayerTypes.ALABASTER then
        if flags == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed - 0.15
        end
        if flags == CacheFlag.CACHE_FLYING then
            player.CanFly = true
        end
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
function ____exports.alabasterRooms(self)
    if game:GetRoom():IsCurrentRoomLastBoss() then
        game:GetLevel():AddAngelRoomChance(-100)
        do
            local i = 0
            while i <= DoorSlot.NUM_DOOR_SLOTS do
                local door = game:GetRoom():GetDoor(i)
                if door == nil then
                    return
                end
                if door:IsRoomType(RoomType.ROOM_ANGEL) then
                    print(
                        "angel type: " .. tostring(
                            door:GetVariant()
                        )
                    )
                    door:SetRoomTypes(RoomType.ROOM_DEVIL, RoomType.ROOM_DEVIL)
                elseif door:IsRoomType(RoomType.ROOM_DEVIL) then
                    print(
                        "devil type: " .. tostring(
                            door:GetVariant()
                        )
                    )
                end
                i = i + 1
            end
        end
    end
end
return ____exports
