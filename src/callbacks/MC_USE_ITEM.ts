import { ModItemTypes } from "../constants";
import { costumes } from "../globals/costumes";
import { bloodDrive } from "../items/active/blooddrive";
import { d50 } from "../items/active/d50";
// import { revive, suicide } from "../items/active/suicide";
import { PlayerData } from "../playerdata";

export function useItem(
  item: number,
  rng: RNG,
  player: EntityPlayer,
  slot: ActiveSlot,
  modPlayerData: { data: PlayerData[] },
): boolean | null {
  let returnVal: boolean | null = null;
  switch (item) {
    /* case ModItemTypes.SUICIDE: {
      returnVal = suicide(modPlayerData, player);
      break;
    }
    case ModItemTypes.REVIVE: {
      returnVal = revive(modPlayerData, player);
      break;
    } */
    case ModItemTypes.BLOODDRIVE: {
      returnVal = bloodDrive(player, modPlayerData);
      break;
    }
    case ModItemTypes.D50: {
      returnVal = d50(item, rng, player, slot, modPlayerData);
      break;
    }
    default:
      break;
  }
  costumes(modPlayerData);
  return returnVal;
}
