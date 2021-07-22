import { game, hud, ModPlayerTypes } from "../constants";
import { PlayerData } from "../playerdata";

const hudOffset = 0;
const OFFSET = Vector(2, 1.2);
const LISTYOFFSET = Vector(0, 13);
const HEARTPATH = "gfx/hudheart.anm2";
let hasAlabaster = false;
const data = {
  firstAlaIndex: -1,
  initialized: false,
  heartSprite: Sprite(),
  vec: Vector(45, 43),
  num2: -10,
  font: Font(),
};
export function init(): void {
  for (let i = 0; i < game.GetNumPlayers(); i++) {
    const player = game.GetPlayer(i);
    if (
      player !== null &&
      player.GetPlayerType() === ModPlayerTypes.ALABASTER
    ) {
      if (data.firstAlaIndex === -1) {
        data.firstAlaIndex = i;
        hasAlabaster = true;
      }
    }
  }
  if (data.firstAlaIndex < 0) {
    return;
  }
  data.initialized = true;
  data.heartSprite = Sprite();
  data.font = Font();
  data.heartSprite.Load(HEARTPATH, true);
  data.heartSprite.Color = Color(1, 1, 1, 1);
  data.heartSprite.Scale = Vector(1, 1);
  data.heartSprite.SetFrame("Idle", 0);
  data.font = Font();
  data.font.Load("font/pftempestasevencondensed.fnt");
}
export function render(modPlayerData: { data: PlayerData[] }): void {
  if (!data.initialized) {
    init();
  }
  if (hud.IsVisible() && hasAlabaster) {
    let x = 0;
    for (let i = 0; i < game.GetNumPlayers(); i++) {
      const player = game.GetPlayer(i);
      if (
        player !== null &&
        (player.GetPlayerType() === PlayerType.PLAYER_XXX_B ||
          player.GetPlayerType() === PlayerType.PLAYER_ISAAC_B)
      ) {
        x = 2;
      }
    }
    if (modPlayerData.data[data.firstAlaIndex].bdcharge !== 0) {
      data.heartSprite.Render(
        data.vec.add(LISTYOFFSET.mul(x)).add(OFFSET.mul(hudOffset)),
        Vector(0, 0),
        Vector(0, 0),
      );
      data.font.DrawString(
        modPlayerData.data[data.firstAlaIndex].bdcharge.toString(),
        data.vec.X + 9 + OFFSET.mul(hudOffset).X,
        data.vec.Y + LISTYOFFSET.mul(x).Y + data.num2 + OFFSET.mul(hudOffset).Y,
        KColor(1, 1, 1, 1),
      );
    }
  }
}
