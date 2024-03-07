wx = {}

wx.ProtectedEvents = { -- List of events that will be protected
    ["test:event"] = true
}

wx.Ban = function (id,event)
    exports['wx_anticheat']:ban(id,("Attempted to trigger safe event - [%s]"):format(event))
end