import { alabasterHealth } from "../globals/alabaster";

export function playerUpdate(player: EntityPlayer): void {
  alabasterHealth(player);
}
