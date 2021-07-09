--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local json = require("json")
local constants = require("constants")
local ____playerdata = require("playerdata")
local GetPlayerId = ____playerdata.GetPlayerId
local modPlayerData = ____playerdata.modPlayerData
local PlayerData = ____playerdata.PlayerData
function ____exports.loadData(self, mod, player)
    if player:GetPlayerType() == constants.ModPlayerTypes.TAINTED_SARAH then
        player:SetPocketActiveItem(constants.ModItemTypes.SUICIDE)
    end
    if mod:HasData() then
        local olddata = json.decode(
            mod:LoadData()
        )
        do
            local i = 0
            while i < constants.game:GetNumPlayers() do
                local id = GetPlayerId(
                    nil,
                    constants.game:GetPlayer(i)
                )
                if id >= 0 then
                    modPlayerData[id] = __TS__New(
                        PlayerData,
                        constants.game:GetPlayer(id),
                        false,
                        0
                    )
                    modPlayerData[id].lost = false
                    modPlayerData[id].razors = olddata[id].razors
                    modPlayerData[id]:RegenerateID()
                end
                i = i + 1
            end
        end
        if (player ~= nil) and (modPlayerData[GetPlayerId(nil, player)].player == nil) then
            modPlayerData[GetPlayerId(nil, player)] = __TS__New(PlayerData, player)
        end
    else
        do
            local i = 0
            while i < constants.game:GetNumPlayers() do
                modPlayerData[i] = __TS__New(
                    PlayerData,
                    constants.game:GetPlayer(i),
                    false,
                    0
                )
                i = i + 1
            end
        end
    end
end
function ____exports.saveData(self, mod)
    mod:SaveData(
        json.encode(modPlayerData)
    )
end
return ____exports
