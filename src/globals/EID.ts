import { ModItemTypes, ModPlayerTypes } from "../constants";

export function descriptions(): void {
  if (EID !== null) {
    Isaac.DebugString("adding eid stuff");
    EID.addCollectible(
      ModItemTypes.GHOST_SHOT,
      "Turns your tears into ghosts that explode",
      "Ghost Shot",
      "en_us",
    );
    EID.addCollectible(
      ModItemTypes.GHOST_SHOT,
      "Rerolls items into the item with the 'opposite' id. With no mods, item 1 (sad onion) rolls into item 729 (Decap Attack)",
      "Stone D6",
      "en_us",
    );
    EID.addCollectible(
      ModItemTypes.BLUE_HEART,
      "Gives 3 soul hearts.",
      "Blue Heart",
      "en_us",
    );
    EID.addCollectible(
      ModItemTypes.GHOST_SHOT,
      "Turns your tears into ghosts#When they touch an enemy or the ground, ghosts explode,dealing 0.4x your damage 3 times.",
      "Ghost Shot",
      "en_us_detailed",
    );
    EID.addCollectible(
      ModItemTypes.BLOODDRIVE,
      "Alabaster's pocket active. Turns 2{{Heart}} into random items if used in a Devil or Angel room. Chances are as follows:#27% chance for a half soul heart(Angel Room) or black heart (Devil Room)#15% for a bomb#15% for a key#15% for 3 coins#10% for card or pill#8% for a trinket#5% for Rune or soul stone#4% for a  random chest (red, gold, grey, old, wooden)#1% chance for a random item",
      "Blood Drive",
      "en_us_detailed",
    );
    EID.addCollectible(
      ModItemTypes.BLOODDRIVE,
      "Alabaster's pocket active. Turns 2{{Heart}} into one pickup if used in a Devil or Angel room. Can give items.",
      "Blood Drive",
      "en_us_detailed",
    );
    EID.addBirthright(
      ModPlayerTypes.ALABASTER,
      "Alabaster now gets small random stat ups similar to Candy Heart when consuming {{Heart}}hearts with Blood Drive",
      "Alabaster",
      "en_us",
    );
  }
}
