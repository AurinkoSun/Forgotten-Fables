--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____json = require("json")
local encode = ____json.encode
function ____exports.preGameExit(self, forgottenFables, modPlayerData)
    forgottenFables:SaveData(
        encode(modPlayerData)
    )
end
return ____exports
