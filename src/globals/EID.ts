export function descriptions(): void {
  if (EID !== null) {
    Isaac.DebugString("adding eid stuff");
    EID.addCollectible(
      Isaac.GetItemIdByName("Ghost Shot"),
      "Turns your tears into ghosts#When they touch an enemy, ghosts explode,#dealing 0.4x your damage 3 times",
      "Ghost Shot",
      "en_us",
    );
    EID.addBirthright(
      Isaac.GetPlayerTypeByName("Alabaster", false),
      "Alabaster now gets small#random stat ups similar#to Candy Heart when#consuming hearts with#Blood Drive",
      "Alabaster",
      "en_us",
    );
  }
}
