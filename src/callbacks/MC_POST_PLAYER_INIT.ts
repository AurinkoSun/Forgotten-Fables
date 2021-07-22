import { ModPlayerData } from "../constants";
import { pocketItems } from "../globals/pocketItems";

export function postPlayerInit(
  _player: EntityPlayer,
  modPlayerData: ModPlayerData,
): void {
  pocketItems(modPlayerData);
}
