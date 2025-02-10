if not IsDuplicityVersion() then return end

wx = {}

-- Change your punish function (Server Side)
wx.BanPlayer = function(src, reason)
    exports.wx_anticheat(src, reason)
end
