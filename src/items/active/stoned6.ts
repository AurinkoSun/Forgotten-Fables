import { ModItemTypes } from "../../constants";

export function stoneD6(): boolean | null {
  for (const entity of Isaac.GetRoomEntities()) {
    if (
      entity.Type === EntityType.ENTITY_PICKUP &&
      entity.Variant === PickupVariant.PICKUP_COLLECTIBLE
    ) {
      const totalItems: number =
        Object.keys(CollectibleType).length -
        1 +
        Object.keys(ModItemTypes).length;

      if (entity.SubType === CollectibleType.COLLECTIBLE_NULL) {
        entity.Remove();
        entity.Update();
        Isaac.Explode(entity.Position, null, 0);
        Isaac.GridSpawn(GridEntityType.GRID_ROCKT, 0, entity.Position, true);
        return true;
      }

      entity
        .ToPickup()
        ?.Morph(
          entity.Type,
          entity.Variant,
          Math.abs(entity.SubType - (totalItems - 1)),
          true,
        );
      Isaac.Spawn(
        EntityType.ENTITY_EFFECT,
        EffectVariant.POOF01,
        0,
        entity.Position,
        Vector(0, 0),
        null,
      ).Kill();
      entity.Update();
    }
  }
  return true;
}
