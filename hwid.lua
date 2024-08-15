local function IsHWIDAllowed(hwid)
    local allowedHWIDs = {
        "5EE1F134-B660-434F-A6C6-3A825069B8D2", --> Owner
        "42A4708C-626C-46FC-A92A-8AA7C185AECF", --> Kamani
        "1607C69B-69D4-4693-BCA8-D900241484D5", --> Dark Vex
        "77F713D3-730A-4E09-A97D-150DA2B30079", --> Obibob
        -- Some are incorrect, need to renew them
    }
    return table.find(allowedHWIDs, hwid) ~= nil
end

return IsHWIDAllowed
