function BetterPrint(text, type)
    local types = {
        ["error"] = "^7[^1 ERROR ^7] ",
        ["warning"] = "^7[^3 WARNING ^7] ",
        ["config"] = "^7[^3 CONFIG WARNING ^7] ",
        ["info"] = "^7[^5 INFO ^7] ",
        ["success"] = "^7[^2 SUCCESS ^7] ",
    }
    return print(("^7[^5 WX SAFEEVENTS ^7] %s %s"):format((types[type or "info"]), text))
end
