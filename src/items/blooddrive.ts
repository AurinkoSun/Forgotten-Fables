import { ModPlayerTypes } from "../constants";

export function bloodDrive(player: EntityPlayer): void {
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
