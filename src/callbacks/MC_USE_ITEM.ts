import { ModItemTypes, ModPlayerData } from "../constants";
import { costumes } from "../globals/costumes";
import { bloodDrive } from "../items/active/blooddrive";
import { bombConverter } from "../items/active/bombconverter";
import { bucketOfMeat } from "../items/active/bucketofmeat";
import { rRoulette } from "../items/active/russianroulette";
import { stoneD6 } from "../items/active/stoned6";
// import { revive, suicide } from "../items/active/suicide";

// eslint-disable-next-line consistent-return
export function useItem(
  item: number,
  rng: RNG,
  player: EntityPlayer,
  _slot: ActiveSlot,
  modPlayerData: ModPlayerData,
): boolean | void {
  let returnVal: boolean | null = null;
  switch (item) {
    case ModItemTypes.MEATBUCKET:
      returnVal = bucketOfMeat(player);
      break;
    case ModItemTypes.BOMBCONVERTER:
      returnVal = bombConverter(player);
      break;
    /* case ModItemTypes.SUICIDE:
      returnVal = suicide(modPlayerData, player);
      break;
    case ModItemTypes.REVIVE:
      returnVal = revive(modPlayerData, player);
      break; */
    case ModItemTypes.RUSSIANROULETTE:
      returnVal = rRoulette(rng, player);
      break;
    case ModItemTypes.BLOODDRIVE:
      returnVal = bloodDrive(player, modPlayerData, rng);
      break;
    case ModItemTypes.STONE_D6:
      returnVal = stoneD6();
      break;
    default:
      break;
  }
  costumes(modPlayerData);
  if (returnVal !== null) {
    return returnVal;
  }
}
