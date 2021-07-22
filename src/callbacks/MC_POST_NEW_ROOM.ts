import { GlobalData, ModPlayerData } from "../constants";
import { costumes } from "../globals/costumes";
import { reversedMercuriusRoomInit } from "../items/passive/reversedMercurius";

export function postNewRoom(
  modPlayerData: ModPlayerData,
  data: GlobalData,
): void {
  costumes(modPlayerData);
  reversedMercuriusRoomInit(data);
}
