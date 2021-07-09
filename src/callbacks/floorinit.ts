import * as constants from "../constants";

export function newFloor(): void {
  const stage = constants.game.GetLevel().GetAbsoluteStage();
  if (stage / 2 === math.floor(stage / 2)) {
    for (let i = 0; i < constants.game.GetNumPlayers(); i++) {
      const player = constants.game.GetPlayer(i);
      if (
        player !== null &&
        player.GetPlayerType() === constants.ModPlayerTypes.TAINTED_SARAH
      ) {
        player.AddBrokenHearts(-1);
      }
    }
  }
}
