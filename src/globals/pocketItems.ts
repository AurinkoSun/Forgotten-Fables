import {
  game,
  ModItemTypes,
  ModPlayerData,
  ModPlayerTypes,
} from "../constants";

export function pocketItems(_modPlayerData: ModPlayerData): void {
  for (let i = 0; i < Game().GetNumPlayers(); i++) {
    const player = game.GetPlayer(i);
    if (player !== null) {
      switch (player.GetPlayerType()) {
        case ModPlayerTypes.ALABASTER: {
          if (
            player.GetActiveItem(ActiveSlot.SLOT_POCKET) !==
            ModItemTypes.BLOODDRIVE
          ) {
            print("blood drive added!");
            player.AddCollectible(
              ModItemTypes.BLOODDRIVE,
              undefined,
              undefined,
              ActiveSlot.SLOT_POCKET,
            );
          }
          break;
        }
        /* case ModPlayerTypes.TAINTED_SARAH: {
          if (modPlayerData.data[GetPlayerId(player)].lost) {
            player.SetPocketActiveItem(
              ModItemTypes.REVIVE as unknown as CollectibleType,
            );
          } else {
            player.SetPocketActiveItem(
              ModItemTypes.SUICIDE as unknown as CollectibleType,
            );
          }
          break;
        } */
        default: {
          break;
        }
      }
    }
  }
}
