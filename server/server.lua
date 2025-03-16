local registeredEvents = {}
local tokens = {}
local receivedPlayers = {}

function GenerateToken(eventName)
    local timestamp = os.time()
    math.randomseed(timestamp * math.random(10000, 999999))
    local randomNumber = math.random(100000, 999999) * math.pi

    local token = ("__wx_safeevents:%s:%d:%d"):format(eventName, timestamp, randomNumber)
    tokens[eventName] = token

    return token
end

function UnregisterSafeEvent(eventName)
    registeredEvents[eventName] = nil
    tokens[eventName] = nil
    BetterPrint(("Safe event has been unregistered: %s"):format(eventName), "error")
    return true
end

function RegisterSafeEvent(eventName)
    if registeredEvents[eventName] then
        BetterPrint(("Attempted to register already registered safe event: %s"):format(eventName), "error")
        return false
    end

    local token = GenerateToken(eventName)

    tokens[eventName] = token
    AddEventHandler(eventName, function(passedToken, ...)
        if passedToken ~= tokens[eventName] then
            wx.BanPlayer(source, "Attempted to trigger Safe Event: " .. eventName)
            return false
        end
    end)
    registeredEvents[eventName] = true
end

RegisterNetEvent('wx_safeevents:fetchData', function()
    if receivedPlayers[source] then
        wx.BanPlayer(source, "Safe Events Exploit")
        return
    end
    TriggerClientEvent('wx_safeevents:getData', source, {
        tokens = tokens,
        events = registeredEvents
    })
end)

AddEventHandler('playerDropped', function()
    receivedPlayers[source] = nil
end)

exports("unregisterSafeEvent", UnregisterSafeEvent)
exports("registerSafeEvent", RegisterSafeEvent)
