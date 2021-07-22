import * as json from "json";
import { game, GlobalData, ModPlayerData, SaveData } from "../constants";
import { PlayerData } from "../playerdata";

export function loadData(
  continued: boolean,
  mod: Mod,
  modPlayerData: ModPlayerData,
  globalData: GlobalData,
): void {
  if (continued && mod.HasData()) {
    const oldData = json.decode(mod.LoadData()) as SaveData;
    for (let i = 0; i < oldData.playerData.data.length; i++) {
      const player = game.GetPlayer(i);
      modPlayerData.data[i] = new PlayerData(
        player,
        oldData.playerData.data[i].bdcharge,
        oldData.playerData.data[i].lost,
        oldData.playerData.data[i].razors,
        oldData.playerData.data[i].tStats,
      );
    }
    Object.assign(oldData.globalData, globalData);
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
    globalData.roomRespawned = false;
  }
}
export function save(mod: Mod, data: SaveData): void {
  mod.SaveData(json.encode(data));
}
