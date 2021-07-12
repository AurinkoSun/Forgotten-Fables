--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local json = require("json")
local ____playerdata = require("playerdata")
local GetPlayerId = ____playerdata.GetPlayerId
local PlayerData = ____playerdata.PlayerData
function ____exports.loadData(self, mod, modPlayerData, player)
    if player == nil then
        player = nil
    end
    local olddata = json.decode(
        mod:LoadData()
    )
    __TS__ObjectAssign(modPlayerData, olddata)
    if (player ~= nil) and (modPlayerData.data[GetPlayerId(nil, player) + 1].player == nil) then
        modPlayerData.data[GetPlayerId(nil, player) + 1] = __TS__New(PlayerData, player)
    end
end
return ____exports
