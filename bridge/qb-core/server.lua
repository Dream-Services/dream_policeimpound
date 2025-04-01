-- Serverside QBCore bridge
if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

while not QBCore do
    QBCore = exports['qb-core']:GetCoreObject()
    Citizen.Wait(500)
end
DreamFramework.ServerFramework = 'qb-core'
DreamFramework.ServerFrameworkLoaded = true

-- Bridge Functions
function DreamFramework.RegisterCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function DreamFramework.GetIdentifier(source)
    local source = source -- Save Variable
    local Identifier = nil -- Create new Variable
    local Player = QBCore.Functions.GetPlayer(source)

    if Player then
        Identifier = Player.PlayerData.citizenid
    end

    return Identifier
end

-- Player Data
local Player = nil
function DreamFramework.getPlayerFromId(source)
    Player = QBCore.Functions.GetPlayer(source)
    if not Player then Player = QBCore.Functions.GetPlayerByCitizenId(source) end
    return Player
end

function DreamFramework.getPlayerSourceFromPlayer(Player)
    return Player.PlayerData.source
end

function DreamFramework.getPlayerName(source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
end

function DreamFramework.getPlayerHeight(source)
    return '/' -- TODO: Lookup for alternative
end

function DreamFramework.getPlayerDOB(source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.PlayerData.charinfo.birthdate
end

function DreamFramework.getPlayerSex(source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.PlayerData.charinfo.gender == 0 and 'm' or 'f'
end

function DreamFramework.getPlayerGroup(source)
    local PlayerPerms = QBCore.Functions.GetPermission(source)
    if DreamFramework.Object.length(PlayerPerms) > 0 then
        local PlayerPermsString = 'Unknown'
        for k, v in pairs(PlayerPerms) do
            if PlayerPermsString == 'Unknown' then
                PlayerPermsString = k
            else
                PlayerPermsString = PlayerPermsString .. ', ' .. k
            end
        end
        return PlayerPermsString
    else
        return 'user'
    end
end

function DreamFramework.getPlayerJob(source, dataType)
    local Player = DreamFramework.getPlayerFromId(source)
    if dataType == 'label' then
        return Player.PlayerData.job.label
    elseif dataType == 'name' then
        return Player.PlayerData.job.name
    elseif dataType == 'grade' then
        return Player.PlayerData.job.grade.level
    elseif dataType == 'gradeLabel' then
        return Player.PlayerData.job.grade.name
    end
end

function DreamFramework.getPlayerMoney(source, moneyWallet)
    local Player = DreamFramework.getPlayerFromId(source)
    if moneyWallet == 'money' then
        return Player.PlayerData.money['cash']
    elseif moneyWallet == 'bank' then
        return Player.PlayerData.money['bank']
    elseif moneyWallet == 'black_money' then
        return Player.PlayerData.money['blackmoney']
    end
end

function DreamFramework.addPlayerMoney(source, moneyWallet, amount)
    local Player = DreamFramework.getPlayerFromId(source)
    if moneyWallet == 'money' then
        Player.Functions.AddMoney('cash', amount)
    elseif moneyWallet == 'bank' then
        Player.Functions.AddMoney('bank', amount)
    elseif moneyWallet == 'black_money' then
        Player.Functions.AddMoney('blackmoney', amount)
    end
end

function DreamFramework.removePlayerMoney(source, moneyWallet, amount)
    local Player = DreamFramework.getPlayerFromId(source)
    if moneyWallet == 'money' then
        Player.Functions.RemoveMoney('cash', amount)
    elseif moneyWallet == 'bank' then
        Player.Functions.RemoveMoney('bank', amount)
    elseif moneyWallet == 'black_money' then
        Player.Functions.RemoveMoney('blackmoney', amount)
    end
end

function DreamFramework.InventoryManagement(source, data)
    local Player = DreamFramework.getPlayerFromId(source)

    if data.type == 'valid' then
        return QBCore.Shared.Items[data.item:lower()] ~= nil
    elseif data.type == 'label' then
        return QBCore.Shared.Items[data.item:lower()].label
    elseif data.type == 'count' then
        local PlayerItem = Player.Functions.GetItemByName(data.item)
        if not PlayerItem then return 0 end -- Return 0 if player does not have item in inventory
        return Player.Functions.GetItemByName(data.item).amount
    elseif data.type == 'weight' then
        return QBCore.Shared.Items[data.item:lower()].weight
    elseif data.type == 'add' then
        Player.Functions.AddItem(data.item, data.amount)
    elseif data.type == 'remove' then
        Player.Functions.RemoveItem(data.item, data.amount)
    end
end

-- Dream Police Impound (QBCore Version)
function DreamFramework.GetOwnedVehicleOwner(plate)
    local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE plate = ?', { plate })[1]
    return result and result.citizenid or nil
end

function DreamFramework.DeleteOwnedVehicle(plate)
    MySQL.Sync.execute('DELETE FROM player_vehicles WHERE plate = ?', { plate })
end

local function getVehicleFromVehList(hash)
    for model, v in pairs(QBCore.Shared.Vehicles) do
        if hash == v.hash then
            return model -- Returns the spawn code, not the name
        end
    end
    return nil -- If not found
end

function DreamFramework.InsertOwnedVehicle(plate, owner, vehicle)
    local Player = DreamFramework.getPlayerFromId(owner)
    if not Player then
        print("[InsertOwnedVehicle] ERROR: Player not found for owner:", tostring(owner))
        return
    end

    local VehicleProps = json.decode(vehicle)
    if not VehicleProps or not VehicleProps['plate'] or not VehicleProps['model'] then
        print("[InsertOwnedVehicle] ERROR: Invalid vehicle data for plate:", tostring(plate))
        return
    end

    -- Find vehicle spawn code based on model hash
    local vehname = getVehicleFromVehList(VehicleProps['model'])

    if not vehname then
        print("[InsertOwnedVehicle] WARNING: Vehicle model not found in QBCore.Shared.Vehicles. Using default hash.")
        vehname = GetDisplayNameFromVehicleModel(VehicleProps['model']):lower() -- Defaults to model name if not found
    end

    -- print("[InsertOwnedVehicle] INSERTING Vehicle -> SpawnCode:", vehname, "Plate:", VehicleProps['plate'])

    MySQL.Sync.execute('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @state)', {
        ['@license'] = Player.PlayerData.license,
        ['@citizenid'] = Player.PlayerData.citizenid,
        ['@vehicle'] = vehname, -- Vehicle spawn code (fixed)
        ['@hash'] = VehicleProps['model'],
        ['@mods'] = vehicle,
        ['@plate'] = VehicleProps['plate'],
        ['@state'] = 0,
    })

    -- print("[InsertOwnedVehicle] SUCCESS: Vehicle inserted for plate:", VehicleProps['plate'])
end

function DreamFramework.GetPlayerNameByIdentifier(identifier)
    local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
    if Player then
        return Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    else
        local result = MySQL.Sync.fetchAll('SELECT charinfo FROM players WHERE citizenid = ?', { identifier })[1]
        if result then
            local charinfo = json.decode(result.charinfo)
            return ('%s %s'):format(charinfo.firstname, charinfo.lastname)
        end
    end
    return "Unknown"
end
