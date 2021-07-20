export function bombConverter(player: EntityPlayer): boolean {
  if (player.GetNumBombs() >= 15) {
    player.AddBombs(-15);
    player.AddGigaBombs(1);
    return true;
  }
  return false;
}
