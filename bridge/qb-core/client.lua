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
function DreamFramework.ServerCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb, ...)
end

function DreamFramework.showHelpNotification(text)
    AddTextEntry('qbHelpNotification', text)
    BeginTextCommandDisplayHelp('qbHelpNotification')
    EndTextCommandDisplayHelp(0, false, false, -1)
end

-- Player Data
function DreamFramework.IsPlayerDataValid()
    local playerData = QBCore.Functions.GetPlayerData()
    return playerData ~= nil and playerData.job ~= nil 
end

function DreamFramework.getPlayerJob()
    while not DreamFramework.IsPlayerDataValid() do 
        Citizen.Wait(500)
    end
    return QBCore.Functions.GetPlayerData().job.name
end

function DreamFramework.getPlayerMoney(moneyWallet)
    local Player = QBCore.Functions.GetPlayerData()
    while not Player or not Player.money do
        Citizen.Wait(500)
        Player = QBCore.Functions.GetPlayerData()
    end
    if moneyWallet == 'money' then
        return Player.money['cash']
    elseif moneyWallet == 'bank' then
        return Player.money['bank']
    elseif moneyWallet == 'black_money' then
        return Player.money['blackmoney']
    end
end

-- Dream Police Impound
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    OnJobChange(JobInfo.name)
end)

function DreamFramework.getVehicleProperties(vehicle)
    return QBCore.Functions.GetVehicleProperties(vehicle)
end

function DreamFramework.spawnVehicle(vehicleModel, vehicleCoords, vehicleHeading, VehicleProps, cb)
    QBCore.Functions.SpawnVehicle(vehicleModel, function(vehicle)
        SetEntityCoords(vehicle, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, false, false, false, true)
        SetEntityHeading(vehicle, vehicleHeading)
        QBCore.Functions.SetVehicleProperties(vehicle, VehicleProps)
        SetVehicleNumberPlateText(vehicle, VehicleProps.plate)
        cb(vehicle)
    end, vehicleCoords, true)
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function ()
    print("Player data loaded. Framework is ready.")
end)