local registeredEvents = {}
local tokens = {}

RegisterNetEvent('wx_safeevents:getData', function(data)
    tokens = data.tokens
    registeredEvents = data.events
end)

function TriggerSafeEvent(eventName, ...)
    if not registeredEvents[eventName] then
        BetterPrint(("❌ Attempted to trigger unregistered safe event: %s"):format(eventName), "error")
        return false
    end

    local token = tokens[eventName]
    if not token then
        BetterPrint(("❌ Token check failed for safe event: %s"):format(eventName), "error")
        return false
    end
    TriggerServerEvent(eventName, token, ...)
    return true
end

CreateThread(function()
    TriggerServerEvent("wx_safeevents:fetchData")
end)

exports("triggerSafeEvent", TriggerSafeEvent)

RegisterCommand('triggersafe', function(source, args, raw)
    TriggerSafeEvent('safetest', "arg1", "arg2")
end)
