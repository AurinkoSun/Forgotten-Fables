import { pocketItems } from "../globals/pocketItems";
import { PlayerData } from "../playerdata";

export function postPlayerInit(
  _player: EntityPlayer,
  modPlayerData: { data: PlayerData[] },
): void {
  pocketItems(modPlayerData);
}
