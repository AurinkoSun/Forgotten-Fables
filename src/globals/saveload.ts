import * as json from "json";
import { game } from "../constants";
import { PlayerData } from "../playerdata";

export function loadData(
  continued: boolean,
  mod: Mod,
  modPlayerData: { data: PlayerData[] },
): void {
  if (continued && mod.HasData()) {
    const olddata = json.decode(mod.LoadData()) as { data: PlayerData[] };
    for (let i = 0; i < olddata.data.length; i++) {
      const player = game.GetPlayer(i);
      if (player !== null) {
        modPlayerData.data[i] = new PlayerData(
          player,
          olddata.data[i].bdcharge,
          olddata.data[i].lost,
          olddata.data[i].razors,
        );
      } else {
        modPlayerData.data[i] = new PlayerData(null, 0, false, 0);
      }
    }
  } else {
    modPlayerData.data = [
      new PlayerData(game.GetPlayer(0), 0, false, 0),
      new PlayerData(game.GetPlayer(1), 0, false, 0),
      new PlayerData(game.GetPlayer(2), 0, false, 0),
      new PlayerData(game.GetPlayer(3), 0, false, 0),
      new PlayerData(game.GetPlayer(3), 0, false, 0),
      new PlayerData(game.GetPlayer(5), 0, false, 0),
      new PlayerData(game.GetPlayer(6), 0, false, 0),
      new PlayerData(game.GetPlayer(7), 0, false, 0),
    ];
  }
}
export function save(mod: Mod, modPlayerData: { data: PlayerData[] }): void {
  mod.SaveData(json.encode(modPlayerData));
}
