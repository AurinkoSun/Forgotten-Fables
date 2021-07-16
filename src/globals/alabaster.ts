import { ModPlayerTypes } from "../constants";

export function alabasterStats(player: EntityPlayer, flags: CacheFlag): void {
  if (player.GetPlayerType() === ModPlayerTypes.ALABASTER) {
    if (flags === CacheFlag.CACHE_SHOTSPEED) {
      player.ShotSpeed -= 0.15;
    }
    if (flags === CacheFlag.CACHE_FLYING) {
      player.CanFly = true;
    }
  }
}
export function alabasterHealth(player: EntityPlayer): void {
  if (player.GetPlayerType() === ModPlayerTypes.ALABASTER) {
    const playerHealth = player.GetMaxHearts();
    if (playerHealth > 0) {
      player.AddMaxHearts(0 - playerHealth, false);
      player.AddBlackHearts(playerHealth);
    }
    const redHealth = player.GetHearts();
    if (redHealth > 0) {
      player.AddHearts(0 - redHealth);
    }
  }
}
export function alabasterRooms(): void {
  if (game.GetRoom().IsCurrentRoomLastBoss()) {
    game.GetLevel().AddAngelRoomChance(-100);
    for (let i = 0; i <= DoorSlot.NUM_DOOR_SLOTS; i++) {
      const door = game.GetRoom().GetDoor(i);
      if (door === null) return;
      if (door.IsRoomType(RoomType.ROOM_ANGEL)) {
        print(`angel type: ${door.GetVariant()}`);
        door.SetRoomTypes(RoomType.ROOM_DEVIL, RoomType.ROOM_DEVIL);
      } else if (door.IsRoomType(RoomType.ROOM_DEVIL))
        print(`devil type: ${door.GetVariant()}`);
    }
  }
}
