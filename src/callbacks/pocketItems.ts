import { game, ModItemTypes, ModPlayerTypes } from "../constants";
import { PlayerData } from "../playerdata";

export function pocketItems(_modPlayerData: { data: PlayerData[] }): void {
  for (let i = 0; i < Game().GetNumPlayers(); i++) {
    const player = game.GetPlayer(i);
    if (player !== null) {
      switch (player.GetPlayerType()) {
        case ModPlayerTypes.ALABASTER: {
          player.SetPocketActiveItem(
            ModItemTypes.BLOODDRIVE as unknown as CollectibleType,
          );
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
