import { GlobalData } from "../constants";
import { reversedMercuriusClear } from "../items/passive/reversedMercurius";

// eslint-disable-next-line consistent-return
export function roomClear(data: GlobalData): boolean | void {
  let val: boolean | null = null;
  val = reversedMercuriusClear(data);
  if (val !== null) {
    return val;
  }
}
