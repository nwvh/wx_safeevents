# WX Safe Events (v2)

Simple approach to easily securing your server events.

This method was made for [WX AntiCheat](https://ac.wx0.dev/), consider purchasing it to make your server protected even more

## Usage

1. Find the event you want to protect on the server side
2. Add an additional first argument:

```lua
-- BEFORE
RegisterNetEvent('eventName',function(arg1, arg2)
    return "something"
end)

-- AFTER
RegisterNetEvent('eventName',function(_, arg1, arg2)
                                     ^^^
    return "something"
end)
```

3. Register the event on the server side using the export below
4. Replace all `TriggerServerEvent('event-you-registered')` on the client side with the export below
5. DONE

## Exports

### Client

```lua
-- Trigger the event
exports.wx_safeevents:triggerSafeEvent('eventName', ...)
```

### Server

```lua
-- Register the event
exports.wx_safeevents:registerSafeEvent('eventName')

-- Unregister the event
exports.wx_safeevents:unregisterSafeEvent('eventName')
```
