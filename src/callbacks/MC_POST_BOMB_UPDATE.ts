import { gigaUpdate } from "../items/passive/fatfetus";

export function bombUpdate(bomb: EntityBomb): void {
  if (bomb.Variant === 21) {
    gigaUpdate(bomb);
  }
}
