--[[
    Open-Source Conditions
	Please read the license conditions in the LICENSE file. By using this script, you agree to these conditions.
]]

-- Set Script Metadata
local ScriptMetadata = {
    id = 'dream_policeimpound',
    name = 'Dream-PoliceImpound',
    label = 'Dream Police Impound',
    version = GetResourceMetadata(GetCurrentResourceName(), 'version', 0),
    patch = GetResourceMetadata(GetCurrentResourceName(), 'patch', 0),
}

-- Check DreamCore
if not DreamCore or type(DreamCore) ~= 'table' then
    print(('\27[1;46m[%s]\27[0m \27[1;37m The ^3DreamCore^7\27[1;37m does not work as it should! It might be a syntax error which caused by changes.^7'):format(ScriptMetadata.name))
    return
end

-- Check Locales
if not DreamLocales[DreamCore.Language] then
    print(('\27[1;46m[%s]\27[0m \27[1;37m The locales prefix (^3%s\27[1;37m) is invalid! Please check that the locales for ^3%s\27[1;37m was created correctly in ^4settings/locales/%s.lua\27[1;37m with the prefix!^7'):format(ScriptMetadata.name, DreamCore.Language, DreamCore.Language, DreamCore.Language))
    return
end

-- Set Dream Services Convar
if DreamCore.GiveCredits then SetConvarServerInfo("Dream Services", "❤️") end

-- Available Print
print(('\27[1;46m[%s]\27[0m \27[1;37m The ^3%s^7\27[1;37m on version ^3%s^7\27[1;37m (^4Patch %s^7\27[1;37m) is now running ✅^7'):format(ScriptMetadata.name, ScriptMetadata.label, ScriptMetadata.version, ScriptMetadata.patch))

-- Check for Updates
Citizen.CreateThread(function()
    PerformHttpRequest('https://api.github.com/repos/Dream-Services/dream_policeimpound/releases/latest', function(Code, Response, Headers, ErrorResponse)
        -- Alert when GitHub API is unreachable
        if Code == 0 then
            print(('\27[1;46m[%s]\27[0m \27[1;37m The ^3GitHub API^7\27[1;37m is unreachable! Tried Endpoint: ^3%s^7'):format(ScriptMetadata.name, 'https://api.github.com/repos/Dream-Services/dream_policeimpound/releases/latest'))
            print(('\27[1;46m[%s]\27[0m \27[1;37m Please check your internet connection/firewall or the status of the GitHub API^7'):format(ScriptMetadata.name))
            return
        end

        if Code >= 200 and Code < 300 then
            ResponseData = json.decode(Response)

            -- Check if a new version is available
            if ResponseData.tag_name:gsub('v', '') ~= ScriptMetadata.version then
                print(('\27[1;46m[%s]\27[0m \27[1;37m🚓 A new version ^3%s\27[1;37m is available since ^3%s UTC\27[1;37m.^7'):format(ScriptMetadata.name, ResponseData.tag_name, os.date('%d.%m.%Y %H:%M:%S', ParseISODateString(ResponseData.published_at))))
                print(('\27[1;46m[%s]\27[0m \27[1;37mPlease update it on ^5GitHub^7:\27[1;37m %s'):format(ScriptMetadata.name, ResponseData.html_url))
            else
                local DownloadCount = ResponseData?.assets?[1]?.download_count or 'few'
                print(('\27[1;46m[%s]\27[0m \27[1;37m🚓 You are running the latest version like ^3%s^7\27[1;37m other people 👮^7'):format(ScriptMetadata.name, DownloadCount))
            end
        else
            ResponseData = json.decode(ErrorResponse:gsub('HTTP %d+: (.+)', '%1'))
            print(('\27[1;46m[%s]\27[0m \27[1;37m An error occurred while checking for updates. Error: ^1%s^7'):format(ScriptMetadata.name, ResponseData.message))
        end
    end, 'GET', '', {
        ['Content-Type'] = 'application/json',
        ['script'] = ScriptMetadata.id
    })
end)

function ParseISODateString(IsoString)
    local year, month, day, hour, min, sec = IsoString:match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)")
    return os.time({ year = year, month = month, day = day, hour = hour, min = min, sec = sec })
end

-- Locales
local Locales = DreamLocales[DreamCore.Language]

-- Global Variables
lib.callback.register('dream_policeimpound:server:getFormData', function(source)
    local source = source
    local OfficerName = 'Unknown'

    if DreamFramework.getPlayerFromId(source) then
        OfficerName = ShortOfficerName(DreamFramework.getPlayerName(source))
    end

    -- Offences
    local AllOffences = MySQL.Sync.fetchAll('SELECT * FROM police_impound_offence')

    return {
        officerName = OfficerName,
        offences = AllOffences
    }
end)

lib.callback.register('dream_policeimpound:server:impoundVehicle', function(source, VehicleProps, ImpoundData)
    local source = source
    local Identifier = DreamFramework.GetIdentifier(source)

    if Identifier then
        local VehicleOwner = DreamFramework.GetOwnedVehicleOwner(VehicleProps.plate)
        if VehicleOwner then
            -- Insert Impound Data
            MySQL.Sync.execute('INSERT INTO police_impound (officer, officer_name, status, duration, fine, offence, notes, vehicle, vehicle_plate, vehicle_owner, vehicle_owner_name) VALUES (@officer, @officer_name, @status, @duration, @fine, @offence, @notes, @vehicle, @vehicle_plate, @vehicle_owner, @vehicle_owner_name)', {
                ['@officer'] = Identifier,
                ['@officer_name'] = ImpoundData.officer,
                ['@status'] = ImpoundData.unlock and 3 or 2,
                ['@duration'] = os.date('%Y-%m-%d %H:%M:%S', math.floor(ImpoundData.duration / 1000)),
                ['@fine'] = ImpoundData.fine, -- Not used it's NULL
                ['@offence'] = ImpoundData.offence,
                ['@notes'] = ImpoundData.note,
                ['@vehicle'] = json.encode(VehicleProps),
                ['@vehicle_plate'] = VehicleProps.plate,
                ['@vehicle_owner'] = VehicleOwner,
                ['@vehicle_owner_name'] = DreamFramework.GetPlayerNameByIdentifier(VehicleOwner),
            })

            -- Delete from owned vehicles db
            DreamFramework.DeleteOwnedVehicle(VehicleProps.plate)

            -- Try to notify the owner
            local xTarget = DreamFramework.getPlayerFromId(VehicleOwner)
            if xTarget then
                TriggerClientEvent('dream_policeimpound:client:notify', DreamFramework.getPlayerSourceFromPlayer(xTarget), Locales['GlobalVehicle']['ImpoundTarget']['Notify']['ImpoundInfo']:format(VehicleProps.plate))
            end

            return { success = true, message = Locales['GlobalVehicle']['ImpoundTarget']['Notify']['ImpoundSuccess']:format(VehicleProps.plate) }
        else
            return { success = false, message = Locales['GlobalVehicle']['ImpoundTarget']['Notify']['ImpoundFail']['NoOwner']:format(VehicleProps.plate) }
        end
    else
        return { success = false, message = Locales['GlobalVehicle']['ImpoundTarget']['Notify']['ImpoundFail']['WrongIdentifer']:format(VehicleProps.plate) }
    end
end)

lib.callback.register('dream_policeimpound:server:getImpoundVehicles', function(source)
    local source = source

    if DreamFramework.getPlayerFromId(source) then
        local Identifier = DreamFramework.GetIdentifier(source)
        local ImpoundVehicles = {}

        if IsInArray(DreamCore.AllowedPoliceJobs, DreamFramework.getPlayerJob(source, 'name')) then
            ImpoundVehicles = MySQL.Sync.fetchAll('SELECT * FROM police_impound WHERE NOT status = 1', {})
        else
            ImpoundVehicles = MySQL.Sync.fetchAll('SELECT * FROM police_impound WHERE vehicle_owner = @vehicle_owner AND NOT status = 1', {
                ['@vehicle_owner'] = Identifier
            })
        end

        if #ImpoundVehicles <= 0 then
            return { success = false, message = Locales['LocalEntity']['ImpoundStation']['Notify']['NoImpoundVehicles'] }
        end

        -- Status Mapping
        local AllAvailableStatus = MySQL.Sync.fetchAll('SELECT * FROM police_impound_status', {})
        local StatusMapping = {}
        for k, v in pairs(AllAvailableStatus) do
            StatusMapping[v.id] = {
                id = v.id,
                name = v.name,
            }
        end

        -- Offence Mapping
        local AllAvailableOffences = MySQL.Sync.fetchAll('SELECT * FROM police_impound_offence', {})
        local OffenceMapping = {}
        for k, v in pairs(AllAvailableOffences) do
            OffenceMapping[v.id] = {
                id = v.id,
                name = v.name,
                amount = v.amount
            }
        end

        -- Update Impound Data
        for k, v in pairs(ImpoundVehicles) do
            ImpoundVehicles[k].status = StatusMapping[v.status]
            ImpoundVehicles[k].offence = OffenceMapping[v.offence]
            ImpoundVehicles[k].vehicle = json.decode(v.vehicle)
            ImpoundVehicles[k].vehicle_plate = v.vehicle_plate
            ImpoundVehicles[k].vehicle_owner = v.vehicle_owner
            ImpoundVehicles[k].vehicle_owner_name = v.vehicle_owner_name
            ImpoundVehicles[k].duration = os.date(DreamCore.ImpoundDurationFormat, math.floor(v.duration / 1000))
        end

        return { success = true, data = ImpoundVehicles }
    end
end)

lib.callback.register('dream_policeimpound:server:unlockVehicle', function(source, ImpoundVehicleId)
    MySQL.Sync.execute('UPDATE police_impound SET status = 2 WHERE id = @id', {
        ['@id'] = ImpoundVehicleId
    })

    -- Try to notify the owner
    local ImpoundVehicleData = MySQL.Sync.fetchAll('SELECT * FROM police_impound WHERE id = @id', {
        ['@id'] = ImpoundVehicleId
    })?[1]

    local xTarget = DreamFramework.getPlayerFromId(ImpoundVehicleData?.vehicle_owner)
    if xTarget then
        TriggerClientEvent('dream_policeimpound:client:notify', DreamFramework.getPlayerSourceFromPlayer(xTarget), Locales['LocalEntity']['ImpoundStation']['Notify']['ImpoundVehicleUnlockInfo']:format(ImpoundVehicleData.vehicle_plate))
    end

    return {
        success = true,
        message = Locales['LocalEntity']['ImpoundStation']['Notify']['PoliceVehicleUnlockSuccess']
    }
end)

lib.callback.register('dream_policeimpound:server:parkOutVehicle', function(source, ImpoundVehicleId)
    local Identifier = DreamFramework.GetIdentifier(source)
    local ImpoundVehicleData = MySQL.Sync.fetchAll('SELECT * FROM police_impound WHERE id = @id', {
        ['@id'] = ImpoundVehicleId
    })?[1]

    if ImpoundVehicleData and Identifier then
        local FineAmount = nil

        if ImpoundVehicleData.fine then
            FineAmount = ImpoundVehicleData.fine
        else
            local OffenceData = MySQL.Sync.fetchAll('SELECT * FROM police_impound_offence WHERE id = @id', {
                ['@id'] = ImpoundVehicleData.offence
            })?[1]
            FineAmount = OffenceData.amount
        end

        if math.floor(ImpoundVehicleData.duration / 1000) <= os.time() then
            -- Check if the player has enough money
            if FineAmount <= DreamFramework.getPlayerMoney(source, 'money') then
                DreamFramework.removePlayerMoney(source, 'money', FineAmount)

                MySQL.Sync.execute('UPDATE police_impound SET status = 1 WHERE id = @id', {
                    ['@id'] = ImpoundVehicleId
                })

                -- Insert in owned vehicles
                DreamFramework.InsertOwnedVehicle(ImpoundVehicleData.vehicle_plate, Identifier, ImpoundVehicleData.vehicle)

                return { success = true, message = Locales['LocalEntity']['ImpoundStation']['Notify']['ImpoundVehicleParkOut'] }
            else
                return { success = false, message = Locales['GlobalVehicle']['ImpoundStation']['Notify']['ImpoundNotEnoughMoney'] }
            end
        else
            return { success = false, message = Locales['LocalEntity']['ImpoundStation']['Notify']['ImpoundVehicleDuration']:format(os.date(DreamCore.ImpoundDurationFormat, math.floor(ImpoundVehicleData.duration / 1000))) }
        end
    else
        return { success = false, message = Locales['LocalEntity']['ImpoundStation']['Notify']['ImpoundVehicleInvalid'] }
    end
end)

function ShortOfficerName(OfficerName)
    local firstNameInitial = OfficerName:match("^(%a)") or ""
    local lastName = OfficerName:match("%s(%a+)$") or ""
    return firstNameInitial .. ". " .. lastName
end

function IsInArray(array, value)
    for _, v in ipairs(array) do
        if v == value then
            return true
        end
    end
    return false
end
