local playersWithGlow = {}

RegisterCommand("me", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    local useGlow = false

    if args[#args] == "glow" then
        useGlow = true
        table.remove(args, #args)
    end

    local color = Config.colors.text

    if useGlow then
        TriggerClientEvent("3dme:show", -1, source, GetEntityCoords(GetPlayerPed(-1)), GetPlayerName(source), message, color, Config.colors.glow)
    else
        TriggerClientEvent("3dme:show", -1, source, GetEntityCoords(GetPlayerPed(-1)), GetPlayerName(source), message, color)
    end
end, false)

RegisterCommand("toggleme", function(source, args, rawCommand)
    local playerId = source
    local hasGlow = playersWithGlow[playerId]

    if not hasGlow then
        playersWithGlow[playerId] = true
        TriggerClientEvent("chatMessage", -1, "SYSTEM", {255, 255, 255}, GetPlayerName(playerId) .. " a activé l'effet glow.")
    else
        playersWithGlow[playerId] = false
        TriggerClientEvent("chatMessage", -1, "SYSTEM", {255, 255, 255}, GetPlayerName(playerId) .. " a désactivé l'effet glow.")
    end
end, false)