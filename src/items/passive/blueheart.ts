import { game, ModItemTypes } from "../../constants";

export function blueHeart(pos: Vector): void {
  let numBlueHearts = 0;
  for (let i = 0; i < game.GetNumPlayers(); i++) {
    const player = game.GetPlayer(i);
    if (player !== null && player.HasCollectible(ModItemTypes.BLUE_HEART)) {
      numBlueHearts += 1;
    }
  }
  if (Game().GetRoom().GetType() === RoomType.ROOM_BOSS) {
    for (let i = 0; i < numBlueHearts * 3; i++) {
      Isaac.Spawn(
        EntityType.ENTITY_PICKUP,
        PickupVariant.PICKUP_HEART,
        HeartSubType.HEART_SOUL,
        Game().GetRoom().FindFreePickupSpawnPosition(pos),
        Vector(0, 0),
        null,
      );
    }
  }
}
