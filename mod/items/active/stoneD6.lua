--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____constants = require("constants")
local ModItemTypes = ____constants.ModItemTypes
function ____exports.stoneD6(self)
    for ____, entity in ipairs(
        Isaac.GetRoomEntities()
    ) do
        if (entity.Type == EntityType.ENTITY_PICKUP) and (entity.Variant == PickupVariant.PICKUP_COLLECTIBLE) then
            local prevID = entity.SubType
            local totalItems = (#__TS__ObjectKeys(CollectibleType) - 1) + #__TS__ObjectKeys(ModItemTypes)
            local entityPos = entity.Position
            if entity.SubType == CollectibleType.COLLECTIBLE_NULL then
                entity:Remove()
                entity:Update()
                Isaac.Explode(entityPos, nil, 0)
                Isaac.GridSpawn(GridEntityType.GRID_ROCKT, 0, entityPos, true)
                return true
            end
            entity:Remove()
            entity:Update()
            Isaac.Spawn(
                EntityType.ENTITY_PICKUP,
                PickupVariant.PICKUP_COLLECTIBLE,
                math.abs(prevID - (totalItems - 1)),
                entityPos,
                Vector(0, 0),
                nil
            )
        end
    end
    return true
end
return ____exports
