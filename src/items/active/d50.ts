import { PlayerData } from "../../playerdata";

export function d50(
  _item: number,
  _rng: RNG,
  player: EntityPlayer,
  slot: ActiveSlot,
  _modPlayerData: { data: PlayerData[] },
): boolean {
  const charges = player.GetActiveCharge(slot);
  if (charges === 12) {
    // stuff
  }
  return true;
}
