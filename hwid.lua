local function IsHWIDAllowed(hwid)
    local allowedHWIDs = {
        "884851C4-5B9E-425A-AF2F-E11F21B8A2C9", --> Owner
        "85AE86FF-A1F4-48B3-BB91-357366878846", --> Kamani
        "4419D8C5-AD3F-4EA5-962B-E14C19B9FD97", --> Dark Vex
        "8225BC76-3A18-4231-87A8-6D86F92B61E0", --> Obibob
        -- Some are incorrect, need to renew them
    }
    return table.find(allowedHWIDs, hwid) ~= nil
end

return IsHWIDAllowed
