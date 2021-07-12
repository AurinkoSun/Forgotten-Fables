--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____costumes = require("globals.costumes")
local costumes = ____costumes.costumes
local ____pocketItems = require("globals.pocketItems")
local pocketItems = ____pocketItems.pocketItems
function ____exports.postNewRoom(self, modPlayerData)
    costumes(nil, modPlayerData)
    pocketItems(nil, modPlayerData)
end
return ____exports
