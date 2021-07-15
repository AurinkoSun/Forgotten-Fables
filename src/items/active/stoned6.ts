import { ModItemTypes } from "../../constants";

export function stoneD6(): boolean | null {
  for (const entity of Isaac.GetRoomEntities()) {
    if (
      entity.Type === EntityType.ENTITY_PICKUP &&
      entity.Variant === PickupVariant.PICKUP_COLLECTIBLE
    ) {
      const prevID: number = entity.SubType;
      const totalItems: number =
        Object.keys(CollectibleType).length -
        1 +
        Object.keys(ModItemTypes).length;
      const entityPos: Vector = entity.Position;
      if (entity.SubType === CollectibleType.COLLECTIBLE_NULL) {
        entity.Remove();
        entity.Update();
        Isaac.Explode(entityPos, null, 0);
        Isaac.GridSpawn(GridEntityType.GRID_ROCKT, 0, entityPos, true);
        return true;
      }

      entity.Remove();
      entity.Update();
      Isaac.Spawn(
        EntityType.ENTITY_PICKUP,
        PickupVariant.PICKUP_COLLECTIBLE,
        Math.abs(prevID - (totalItems - 1)),
        entityPos,
        Vector(0, 0),
        null,
      );
    }
  }
  return true;
}
