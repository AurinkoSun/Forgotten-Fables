import { costumes } from "../globals/costumes";
import { pocketItems } from "../globals/pocketItems";
import { PlayerData } from "../playerdata";

export function postNewRoom(modPlayerData: { data: PlayerData[] }): void {
  costumes(modPlayerData);
  pocketItems(modPlayerData);
}
