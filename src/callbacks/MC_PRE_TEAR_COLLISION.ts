import { ghostCollide } from "../items/passive/ghostshot";

export function preTearCollision(
  tear: EntityTear,
  collider: Entity,
  _low: boolean,
): void {
  ghostCollide(tear, collider);
}
