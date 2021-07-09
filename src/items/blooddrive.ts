import { ModPlayerTypes } from "../constants";
import { PlayerData } from "../playerdata";

export function bloodDrive(
  player: EntityPlayer,
  _modPlayerData: { data: PlayerData[] },
): void {
  if (player.GetPlayerType() === ModPlayerTypes.ALABASTER) {
    print("hi");
  }
}
export function alabasterHearts(pickup: EntityPickup): void {
  if (
    pickup.Variant === PickupVariant.PICKUP_HEART &&
    (pickup.SubType === HeartSubType.HEART_FULL ||
      pickup.SubType === HeartSubType.HEART_HALF ||
      pickup.SubType === HeartSubType.HEART_DOUBLEPACK)
  ) {
    // do stuff
  }
}
