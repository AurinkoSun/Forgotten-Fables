import { ghostUpdate } from "../items/passive/ghostshot";
import { necrosisLudo } from "../items/passive/necrosis";

export function tearUpdate(tear: EntityTear): void {
  ghostUpdate(tear);
  necrosisLudo(tear);
}
