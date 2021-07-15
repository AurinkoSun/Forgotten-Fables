import { ModItemTypes } from "../constants";
import { costumes } from "../globals/costumes";
import { bloodDrive } from "../items/active/blooddrive";
import { rRoulette } from "../items/active/russianroulette";
import { stoneD6 } from "../items/active/stoned6";
// import { revive, suicide } from "../items/active/suicide";
import { PlayerData } from "../playerdata";

// eslint-disable-next-line consistent-return
export function useItem(
  item: number,
  rng: RNG,
  player: EntityPlayer,
  _slot: ActiveSlot,
  modPlayerData: { data: PlayerData[] },
): boolean | void {
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
    case ModItemTypes.RUSSIANROULETTE: {
      returnVal = rRoulette(rng, player);
      break;
    }
    case ModItemTypes.BLOODDRIVE: {
      returnVal = bloodDrive(player, modPlayerData);
      break;
    }
    case ModItemTypes.STONE_D6: {
      returnVal = stoneD6();
      break;
    }
    default:
      break;
  }
  costumes(modPlayerData);
  if (returnVal !== null) {
    return returnVal;
  }
}
