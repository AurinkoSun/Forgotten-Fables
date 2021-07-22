import { ModPlayerData } from "../constants";
import { costumes } from "../globals/costumes";

export function usePill(
  _pillEffect: number,
  _player: EntityPlayer,
  _useFlags: number,
  modPlayerData: ModPlayerData,
): void {
  costumes(modPlayerData);
}
