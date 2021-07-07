--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local constants = require("constants")
function ____exports.GetPlayerId(self, player)
    local returner = -1
    do
        local i = 0
        while i < constants.game:GetNumPlayers() do
            local playeri = constants.game:GetPlayer(i)
            if ((playeri ~= nil) and (player ~= nil)) and (playeri:GetCollectibleRNG(1):GetSeed() == player:GetCollectibleRNG(1):GetSeed()) then
                returner = i
            end
            i = i + 1
        end
    end
    return returner
end
____exports.modPlayerData = {}
____exports.PlayerData = __TS__Class()
local PlayerData = ____exports.PlayerData
PlayerData.name = "PlayerData"
function PlayerData.prototype.____constructor(self, player, lost, razors)
    if player == nil then
        player = nil
    end
    if lost == nil then
        lost = false
    end
    if razors == nil then
        razors = 0
    end
    self.player = nil
    self.lost = lost
    self.razors = razors
    self.id = ((player ~= nil) and ____exports.GetPlayerId(nil, player)) or -1
end
function PlayerData.prototype.RegenerateID(self)
    self.id = ____exports.GetPlayerId(nil, self.player)
end
function ____exports.PlayerSeed(self, player, CollID)
    if CollID == nil then
        CollID = 1
    end
    return ((player ~= nil) and player:GetCollectibleRNG(CollID):GetSeed()) or -1
end
return ____exports
