--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____constants = require("constants")
local game = ____constants.game
function ____exports.renderHud(self, modPlayerData, p1alabaster)
    local hud = game:GetHUD()
    if hud:IsVisible() and p1alabaster then
        local heartSprite = Sprite()
        heartSprite:Load("gfx/hudheart.anm2", true)
        heartSprite.Color = Color(1, 1, 1, 1)
        heartSprite.Scale = Vector(0.5, 0.5)
        heartSprite:SetFrame("Idle", 0)
        local font = Font()
        font:Load("font/pftempestasevencondensed.fnt")
        local str = ((modPlayerData.data ~= nil) and modPlayerData.data[1].bdcharge) or 0
        font:DrawString(
            __TS__NumberToString(str, 2),
            40,
            31,
            KColor(1, 1, 1, 1)
        )
    end
end
return ____exports
