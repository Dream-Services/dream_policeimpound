-- Serverside ESX bridge
if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports['es_extended']:getSharedObject()

while not ESX do
    ESX = exports['es_extended']:getSharedObject()
    Citizen.Wait(500)
end
DreamFramework.ServerFramework = 'esx'
DreamFramework.ServerFrameworkLoaded = true

-- Bridge Functions
function DreamFramework.ServerCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb, ...)
end

function DreamFramework.showHelpNotification(text)
    ESX.ShowHelpNotification(text)
end

-- Player Data
function DreamFramework.IsPlayerDataValid()
    return ESX.GetPlayerData() ~= nil
end

function DreamFramework.getPlayerJob()
    if not DreamFramework.IsPlayerDataValid() then return false end

    if ESX.GetPlayerData().job then
        return ESX.GetPlayerData().job.name
    else
        return nil
    end
end

function DreamFramework.getPlayerMoney(moneyWallet)
    local PlayerData = ESX.GetPlayerData()
    for k, v in pairs(PlayerData['accounts']) do
        if v.name == moneyWallet then
            return v.money
        end
    end
end

-- Dream Police Impound
RegisterNetEvent('esx:setJob', function(job, lastJob)
    OnJobChange(job.name)
end)

function DreamFramework.getVehicleProperties(vehicle)
    return ESX.Game.GetVehicleProperties(vehicle)
end

function DreamFramework.spawnVehicle(vehicleModel, vehicleCoords, vehicleHeading, VehicleProps, cb)
    ESX.Game.SpawnVehicle(vehicleModel, vehicleCoords, vehicleHeading, function(vehicle)
        ESX.Game.SetVehicleProperties(vehicle, VehicleProps)
        SetVehicleNumberPlateText(vehicle, VehicleProps.plate)
        cb(vehicle)
    end)
end
