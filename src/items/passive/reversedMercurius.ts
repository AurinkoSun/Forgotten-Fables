import { game, GlobalData, ModItemTypes } from "../../constants";

export function reversedMercuriusClear(data: GlobalData): boolean | null {
  if (data.roomRespawned) {
    return true;
  }
  let done = false;
  game.GetRoom().KeepDoorsClosed();
  for (let i = 0; i < game.GetNumPlayers(); i++) {
    const player = game.GetPlayer(i);
    if (player !== null && player.HasCollectible(ModItemTypes.BOMBCONVERTER)) {
      if (!done) {
        player.UseActiveItem(
          CollectibleType.COLLECTIBLE_D7,
          false,
          false,
          true,
          false,
        );
      }
      done = true;
    }
  }
  return true;
}
export function reversedMercuriusRoomInit(data: GlobalData): void {
  for (let i = 0; i < game.GetNumPlayers(); i++) {
    const player = game.GetPlayer(i);
    if (player !== null && player.HasCollectible(ModItemTypes.BOMBCONVERTER)) {
      barDoors();
    }
  }
  data.roomRespawned = true;
}
function barDoors(): void {
  const doors: DoorSlot[] = [];
  for (let i = 0; i < DoorSlot.NUM_DOOR_SLOTS; i++) {
    if (game.GetRoom().IsDoorSlotAllowed(i)) {
      doors.push(i);
    }
  }
  for (const i of doors) {
    const door = game.GetRoom().GetDoor(i);
    if (door !== null) {
      door.Bar();
    }
  }
}
