local safeevents = {}

for event,val in pairs(wx.ProtectedEvents) do
    if val then
        print("Registering safe event:",event)
        RegisterNetEvent(event)
        AddEventHandler(event,function ()
            local source = tostring(source)
            if safeevents[source] == nil then
                CancelEvent()
                print(("Player [%s] %s has attempted to trigger an event via executor - [%s]"):format(source,GetPlayerName(tonumber(source)),event))
                return wx.Ban(tonumber(source),event)
            end
        end)
    end
end

RegisterNetEvent('wx_safeevents:safeEvent')
AddEventHandler('wx_safeevents:safeEvent',function (event)
    local source = tostring(source)
    if not wx.ProtectedEvents[event] then
        return print("Attempted to trigger unregistered safe event. Please register it in the config",event)
    end
    safeevents[source] = event
    print(safeevents[source])
    Wait(500)
    safeevents[source] = nil
end)