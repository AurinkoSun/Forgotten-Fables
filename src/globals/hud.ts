import { game } from "../constants";
import { PlayerData } from "../playerdata";

export function renderHud(
  modPlayerData: { data: PlayerData[] },
  p1alabaster: boolean,
): void {
  const hud = game.GetHUD();
  if (hud.IsVisible() && p1alabaster) {
    const heartSprite = Sprite();
    heartSprite.Load("gfx/hudheart.anm2", true);
    heartSprite.Color = Color(1, 1, 1, 1);
    heartSprite.Scale = Vector(0.5, 0.5);
    heartSprite.SetFrame("Idle", 0);
    const font = Font();
    font.Load("font/pftempestasevencondensed.fnt");
    const str =
      modPlayerData.data !== null ? modPlayerData.data[0].bdcharge : 0;
    font.DrawString(str.toString(2), 40, 31, KColor(1, 1, 1, 1));
  }
}
