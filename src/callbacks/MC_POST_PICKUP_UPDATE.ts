// import { razor } from "../globals/razors";
import { ModPlayerData } from "../constants";
import { alabasterHearts } from "../items/active/blooddrive";

export function postPickupUpdate(
  pickup: EntityPickup,
  modPlayerData: ModPlayerData,
): void {
  if (pickup.Variant === PickupVariant.PICKUP_HEART) {
    // razor(modPlayerData, pickup);
    alabasterHearts(pickup, modPlayerData);
  }
}
