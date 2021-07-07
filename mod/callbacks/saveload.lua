--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local json = require("json")
local constants = require("constants")
local ____playerdata = require("playerdata")
local modPlayerData = ____playerdata.modPlayerData
local PlayerData = ____playerdata.PlayerData
local GetPlayerId = ____playerdata.GetPlayerId
local PlayerSeed = ____playerdata.PlayerSeed
function ____exports.loadData(self, mod, player)
    if player == nil then
        player = nil
    end
    local olddata = json.decode(
        mod:LoadData()
    )
    local seeds = {0, 0, 0, 0, 0, 0, 0, 0}
    do
        local i = 0
        while i < constants.game:GetNumPlayers() do
            local seed = PlayerSeed(
                nil,
                constants.game:GetPlayer(i)
            )
            if seed ~= -1 then
                modPlayerData[seed].player = olddata[seed].player
                modPlayerData[seed].lost = olddata[seed].lost
                modPlayerData[seed].razors = olddata[seed].razors
                modPlayerData[seed]:RegenerateID()
            end
            i = i + 1
        end
    end
    if (player ~= nil) and (modPlayerData[GetPlayerId(nil, player)].player == nil) then
        modPlayerData[GetPlayerId(nil, player)] = __TS__New(PlayerData, player)
    end
end
function ____exports.saveData(self, mod)
    do
        local i = 0
        while i < constants.game:GetNumPlayers() do
            local ____ = modPlayerData[PlayerSeed(
                nil,
                constants.game:GetPlayer(i)
            )]
            i = i + 1
        end
    end
    mod:SaveData(
        json.encode(modPlayerData)
    )
end
return ____exports
