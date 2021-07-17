// import { razor } from "../globals/razors";
import { alabasterHearts } from "../items/active/blooddrive";
import { PlayerData } from "../playerdata";

export function postPickupUpdate(
  pickup: EntityPickup,
  modPlayerData: { data: PlayerData[] },
): void {
  if (pickup.Variant === PickupVariant.PICKUP_HEART) {
    // razor(modPlayerData, pickup);
    alabasterHearts(pickup, modPlayerData);
  }
}
