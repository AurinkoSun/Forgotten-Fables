import * as constants from "./constants";
/**
 * Class to keep track of various mod data regarding a player.
 *
 */

export class PlayerData {
  lost: boolean;
  razors: number;
  player: EntityPlayer | null = null;
  id: number;
  /**
   * @param player
   * the player to attach to the PlayerData
   * @param lost
   * Whether or not the player is in their 'lost' form through the Suicide item. Default is 0.
   * @param razors
   * The number of razors the player has. Used to calculate T.Sarah's damage.
   * @returns a new PlayerData object
   */
  constructor(player: EntityPlayer | null = null, lost = false, razors = 0) {
    this.player = player;
    this.lost = lost;
    this.razors = razors;
    this.id = player !== null ? GetPlayerId(player) : -1;
  }

  RegenerateID(): void {
    this.id = GetPlayerId(this.player);
  }
}
export function GetPlayerId(player: EntityPlayer | null): number {
  /**
   * Gets the 'id' of a player. Inverse of Game().GetPlayer()
   * @param player
   * The player to get the index for.
   * @returns the player's id, as an integer. If the player is null, returns 0
   */
  let returner = 0;
  for (let i = 0; i < constants.game.GetNumPlayers(); i++) {
    const playeri = constants.game.GetPlayer(i);
    if (
      playeri !== null &&
      player !== null &&
      playeri.GetCollectibleRNG(1).GetSeed() ===
        player.GetCollectibleRNG(1).GetSeed()
    ) {
      returner = i;
    }
  }
  return returner;
}
export function PlayerSeed(player: EntityPlayer | null, CollID = 1): number {
  /**
   * For when you need to know the seed of the player to check it against something else.
   * @param player
   * The player to get the seed of.
   * @param CollID
   * @default 1
   * The ID of the collectible to use. Default is 1, which is what GetPlayerID() uses. Leave default unless you know what you're doing.
   * @returns the seed as an integer value
   */
  return player !== null ? player.GetCollectibleRNG(CollID).GetSeed() : -1;
}
