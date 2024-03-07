local TSE = TriggerServerEvent

function TriggerSafeEvent(event,...)
    TSE("wx_safeevents:safeEvent",event)
    Wait(250)
    return TSE(event,...)
end

TriggerServerEvent = TriggerSafeEvent

