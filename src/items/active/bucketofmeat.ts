export function bucketOfMeat(player: EntityPlayer): boolean {
  let counter = 0;
  for (const entity of Isaac.GetRoomEntities()) {
    if (
      entity.Type === EntityType.ENTITY_PICKUP &&
      entity.Variant === PickupVariant.PICKUP_HEART
    ) {
      if (entity.SubType === HeartSubType.HEART_HALF) {
        counter += 1;
        entity.Remove();
      } else if (entity.SubType === HeartSubType.HEART_FULL) {
        counter += 2;
        entity.Remove();
      }
    }
  }
  if (counter === 0) {
    return false;
  }
  for (let i = 0; i < counter / 2; i++) {
    Isaac.Spawn(
      EntityType.ENTITY_FAMILIAR,
      FamiliarVariant.BLOOD_BABY,
      7,
      player.Position,
      player.Velocity,
      player,
    );
  }
  return true;
}
