import { rocks } from "../items/passive/fatfetus";

export function projectileInit(projectile: EntityProjectile): void {
  if (projectile.Variant === ProjectileVariant.PROJECTILE_ROCK) {
    rocks(projectile);
  }
}
