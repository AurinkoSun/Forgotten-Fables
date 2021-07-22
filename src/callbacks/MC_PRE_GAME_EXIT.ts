import { SaveData } from "../constants";
import { save } from "../globals/saveload";

export function preGameExit(forgottenFables: Mod, data: SaveData): void {
  save(forgottenFables, data);
}
