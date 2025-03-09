--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['en'] = {
    ['NotifyHeader'] = 'Police Impound',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Impound vehicle',
            ['Dialog'] = {
                ['Title'] = '🚓 Vehicle Impound',
                ['Model'] = 'Modell',
                ['Plate'] = 'Plate',
                ['Officer'] = 'Officer',
                ['Duration'] = 'Duration',
                ['Offence'] = 'Offence',
                ['OffencePlaceholder'] = 'Select an offence',
                ['Fine'] = 'Fine',
                ['Note'] = 'Extra Note',
                ['NeedUnlock'] = 'Need to unlocked first through the LSPD',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'The vehicle %s was successfully impounded.',
                ['ImpoundInfo'] = 'Your vehicle %s was impounded by the police.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'The vehicle %s could not be impounded.',
                    ['NoOwner'] = 'The vehicle %s has no owner.',
                }

            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Police Impound',
            ['Menu'] = {
                ['Title'] = '🚓 Police Impound',
                ['PoliceVehicleDesc'] = 'The owner must collect the vehicle',
                ['PoliceVehicleUnlockDesc'] = 'Click to unlock the vehicle',
                ['VehicleDesc'] = 'Click to park out the vehicle',
                ['VehicleUnlockDesc'] = 'A Officer need to unlock the vehicle',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Status',
                ['Owner'] = '🤵 Owner',
                ['Officer'] = '👮 Officer',
                ['Modell'] = '🚗 Modell',
                ['Plate'] = '🔢 Plate',
                ['Offence'] = '⚖️ Offence',
                ['Fine'] = '💰 Fine',
                ['Duration'] = '⏳ Duration',
                ['Note'] = '📝 Note',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'There are no vehicles in the impound',
                ['PoliceVehicleUnlockSuccess'] = 'The vehicle was successfully unlocked',
                ['ImpoundVehicleInvalid'] = 'The Impound Vehicle is invalid',
                ['ImpoundVehicleUnlockInfo'] = 'Your vehicle %s was unlocked by the police',
                ['ImpoundVehicleDuration'] = 'You need to wait until %s to park out the vehicle',
                ['ImpoundNotEnoughMoney'] = 'You do not have enough money to park out the vehicle',
                ['ImpoundVehicleParkOut'] = 'The vehicle is parked out',
            }
        }
    }
}
