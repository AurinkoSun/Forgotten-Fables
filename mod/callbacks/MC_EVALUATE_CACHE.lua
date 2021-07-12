--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____alabaster = require("globals.alabaster")
local alabasterStats = ____alabaster.alabasterStats
local ____fatfetus = require("items.passive.fatfetus")
local ffstats = ____fatfetus.ffstats
local ____ghostshot = require("items.passive.ghostshot")
local ghostShotStats = ____ghostshot.ghostShotStats
function ____exports.evalCache(self, _modPlayerData, player, flags)
    alabasterStats(nil, player, flags)
    ffstats(nil, player, flags)
    ghostShotStats(nil, player, flags)
end
return ____exports
