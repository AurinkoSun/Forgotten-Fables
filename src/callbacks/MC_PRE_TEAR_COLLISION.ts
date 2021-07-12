import { ghostUpdate } from "../items/passive/ghostshot";

export function preTearCollision(
  tear: EntityTear,
  collider: Entity,
  _low: boolean,
): void {
  ghostUpdate(tear, collider);
}
