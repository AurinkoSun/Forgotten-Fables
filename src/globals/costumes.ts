import * as constants from "../constants";

export function costumes(_modPlayerData: constants.ModPlayerData): void {
  for (let i = 0; i < 8; i++) {
    const player = Isaac.GetPlayer(i);
    if (player !== null) {
      /* case constants.ModPlayerTypes.SARAH: {
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
        } */
      if (player.GetPlayerType() === Isaac.GetPlayerTypeByName("Alabaster")) {
        player.TryRemoveNullCostume(constants.ModCostumes.ALABASTER_HAIR);
        player.AddNullCostume(constants.ModCostumes.ALABASTER_HAIR);
        player.GetData().costumeEquipped = true;
      }
    }
  }
}
