local function IsHWIDAllowed(hwid)
    local allowedHWIDs = {
        "5EE1F134-B660-434F-A6C6-3A825069B8D2", --> Owner
        "85AE86FF-A1F4-48B3-BB91-357366878846", --> Kamani
        "1607C69B-69D4-4693-BCA8-D900241484D5", --> Dark Vex
        "8225BC76-3A18-4231-87A8-6D86F92B61E0", --> Obibob
        -- Some are incorrect, need to renew them
    }
    return table.find(allowedHWIDs, hwid) ~= nil
end

return IsHWIDAllowed
