import { costumes } from "../globals/costumes";
import { PlayerData } from "../playerdata";

export function postNewRoom(modPlayerData: { data: PlayerData[] }): void {
  costumes(modPlayerData);
}
