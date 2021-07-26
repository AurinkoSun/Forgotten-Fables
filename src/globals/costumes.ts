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
        if (player.HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE)) {
          if (
            player.GetCollectibleNum(CollectibleType.COLLECTIBLE_BRIMSTONE) < 1
          ) {
            player.TryRemoveNullCostume(constants.ModCostumes.ALABASTERBRIM2);
            player.AddNullCostume(constants.ModCostumes.ALABASTERBRIM2);
          } else {
            player.TryRemoveNullCostume(constants.ModCostumes.ALABASTERBRIM);
            player.AddNullCostume(constants.ModCostumes.ALABASTERBRIM);
          }
        }
        if (player.HasCollectible(CollectibleType.COLLECTIBLE_LIBRA)) {
          player.TryRemoveNullCostume(constants.ModCostumes.ALABASTERLIBRA);
          player.AddNullCostume(constants.ModCostumes.ALABASTERLIBRA);
        }
        player.GetData().costumeEquipped = true;
      }
    }
  }
}
