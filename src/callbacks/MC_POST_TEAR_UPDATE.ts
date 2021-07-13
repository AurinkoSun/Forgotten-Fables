import { ModTearVariants } from "../constants";
import { ghostUpdate } from "../items/passive/ghostshot";

export function tearUpdate(tear: EntityTear): void {
  if (tear.Variant === ModTearVariants.GHOST) {
    ghostUpdate(tear);
  }
}
