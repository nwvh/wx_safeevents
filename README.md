# WX Safe Events
Simple, yet functional Safe Events feature for FiveM

This method was made for [WX AntiCheat](https://anticheat.0wx.space/), consider purchasing it to make your server protected even more


# What are Safe Events?
**Safe Events** (*sometimes Protected Events*) are server events in FiveM, that are (as the name suggests) protected against cheaters by an additional resource, in this case by wx_safeevents. It allows normal players to trigger them without problems, but when a cheater with an executor tries to execute them, it will ban the cheater.

# Installation
* Find a resource you want to protect
* Find any event(s) that you want to protect and add them to the config
* Go to the fxmanifest.lua of the resource and edit it like so:
```lua
-- client_script "client.lua" -- REMOVE THIS LINE

client_scripts {
    "@wx_safeevents/client/client.lua", -- Make sure the safe event module is loaded first
    "client.lua",
    -- load any other client scripts
}

-- Basically make sure the safe event module is loaded before first before other client scripts
```
* Restart your server
* Profit ???

# Additional Info

* Please note that this method won't stop 100% of your cheaters, this method is somewhat bypassable, if the cheater has some knowledge about FiveM events and isn't blindly triggering them.
