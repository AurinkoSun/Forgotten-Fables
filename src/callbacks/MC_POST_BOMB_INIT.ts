import { gigaBombReplace, gigaInit } from "../items/passive/fatfetus";
import { gsBomb } from "../items/passive/ghostshot";

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
  gsBomb(bomb);
}
