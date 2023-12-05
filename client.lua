local textColor = Config.colors.text
local glowColor = Config.colors.glow

RegisterNetEvent("3dme:show")
AddEventHandler("3dme:show", function(playerId, coords, author, message, color, useGlow)
    local myId = PlayerId()
    local targetId = GetPlayerFromServerId(playerId)

    local shouldUseGlow = useGlow or false

    if shouldUseGlow then
        local hasGlow = playersWithGlow[targetId]

        if hasGlow then
            DrawAboveHeadText(targetId, coords, "^*^7" .. author .. ":^r " .. message, color, glowColor)
        else
            DrawAboveHeadText(targetId, coords, "^*^7" .. author .. ":^r " .. message, color)
        end
    else
        DrawAboveHeadText(targetId, coords, "^*^7" .. author .. ":^r " .. message, color)
    end
end)

function DrawAboveHeadText(targetId, coords, text, color, glow)
    local playerPed = GetPlayerPed(-1)

    if DoesEntityExist(playerPed) and NetworkIsPlayerActive(targetId) then
        local head = GetEntityBoneIndexByName(playerPed, "SKEL_HEAD")
        local headCoords = GetWorldPositionOfEntityBone(playerPed, head)

        local dist = GetDistanceBetweenCoords(headCoords, coords, true)

        if dist < 15 then
            DrawText3D(coords.x, coords.y, coords.z + Config.text.offset, text, color, glow)
        end
    end
end

function DrawText3D(x, y, z, text, color, glow)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if onScreen then
        SetTextScale(Config.text.fontSize, Config.text.fontSize)
        SetTextFont(4)
        SetTextProportional(1)

        local hexColor = color or textColor
        local hexGlowColor = glow or glowColor

        SetTextColour(hexColor[1], hexColor[2], hexColor[3], hexColor[4])

        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)

        if glow then
            SetTextOutline(hexGlowColor[1], hexGlowColor[2], hexGlowColor[3], hexGlowColor[4])
        end

        DrawText(_x, _y)
    end
end