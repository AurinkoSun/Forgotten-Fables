import * as constants from "../constants";
import { GetPlayerId, PlayerData } from "../playerdata";

export function costumes(modPlayerData: { data: PlayerData[] }): void {
  for (let i = 0; i < constants.game.GetNumPlayers(); i++) {
    const player = Isaac.GetPlayer(i);
    if (player !== null) {
      switch (player.GetPlayerType()) {
        case constants.ModPlayerTypes.SARAH: {
          player.TryRemoveNullCostume(constants.ModCostumes.SARAH_HAIR);
          player.AddNullCostume(constants.ModCostumes.SARAH_HAIR);
          player.GetData().costumeEquipped = true;
          break;
        }
        case constants.ModPlayerTypes.TAINTED_SARAH: {
          if (modPlayerData.data[GetPlayerId(player)].lost) {
            player.TryRemoveNullCostume(constants.ModCostumes.LOST_SARAH_HAIR);
            player.AddNullCostume(constants.ModCostumes.LOST_SARAH_HAIR);
          } else {
            player.TryRemoveNullCostume(constants.ModCostumes.LOST_SARAH_HAIR);
            player.AddNullCostume(constants.ModCostumes.LOST_SARAH_HAIR);
          }
          player.GetData().costumeEquipped = true;
          break;
        }
        case constants.ModPlayerTypes.ALABASTER: {
          player.TryRemoveNullCostume(constants.ModCostumes.ALABASTER_HAIR);
          player.AddNullCostume(constants.ModCostumes.ALABASTER_HAIR);
          player.GetData().costumeEquipped = true;
          break;
        }
        default: {
          break;
        }
      }
    }
  }
}
