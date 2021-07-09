import * as json from "json";
import { GetPlayerId, PlayerData } from "../playerdata";

export function loadData(
  mod: Mod,
  modPlayerData: { data: PlayerData[] },
  player: EntityPlayer | null = null,
): void {
  const olddata = json.decode(mod.LoadData()) as {
    [index: number]: PlayerData;
  };
  Object.assign(modPlayerData, olddata);
  if (
    player !== null &&
    modPlayerData.data[GetPlayerId(player)].player === null
  ) {
    modPlayerData.data[GetPlayerId(player)] = new PlayerData(player);
  }
}
