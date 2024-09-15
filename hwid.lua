local function IsHWIDAllowed(hwid)
    local allowedHWIDs = {
        "884851C4-5B9E-425A-AF2F-E11F21B8A2C9", --> Owner
        "09CD97B4-E0BD-4900-8950-896C59075A9D", --> Kamani
        "4419D8C5-AD3F-4EA5-962B-E14C19B9FD97", --> Dark Vex
        "8225BC76-3A18-4231-87A8-6D86F92B61E0", --> Obibob
        -- Some are incorrect, need to renew them
    }
    return table.find(allowedHWIDs, hwid) ~= nil
end

return IsHWIDAllowed
