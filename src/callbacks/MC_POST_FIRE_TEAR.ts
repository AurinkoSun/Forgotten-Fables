import { fatFetusTears } from "../items/passive/fatfetus";
import { ghostShot } from "../items/passive/ghostshot";

export function postFireTear(tear: EntityTear): void {
  fatFetusTears(tear);
  ghostShot(tear);
  print(tear.HomingFriction);
}
