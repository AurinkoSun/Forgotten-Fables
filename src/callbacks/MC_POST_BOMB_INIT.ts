import { gigaBombReplace, gigaInit } from "../items/passive/fatfetus";

export function bombInit(bomb: EntityBomb): void {
  if (
    bomb.Variant === BombVariant.BOMB_GIGA ||
    bomb.Variant === BombVariant.BOMB_ROCKET_GIGA
  ) {
    gigaBombReplace(bomb);
  }
  if (bomb.Variant === 21) {
    gigaInit(bomb);
  }
}
