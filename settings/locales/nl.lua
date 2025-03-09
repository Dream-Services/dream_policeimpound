--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['nl'] = {
    ['NotifyHeader'] = 'Politie Depot',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Voertuig in beslag nemen',
            ['Dialog'] = {
                ['Title'] = '🚓 Voertuig Inbeslagname',
                ['Model'] = 'Model',
                ['Plate'] = 'Kenteken',
                ['Officer'] = 'Agent',
                ['Duration'] = 'Duur',
                ['Offence'] = 'Overtreding',
                ['OffencePlaceholder'] = 'Selecteer een overtreding',
                ['Fine'] = 'Boete',
                ['Note'] = 'Extra opmerking',
                ['NeedUnlock'] = 'Moet eerst worden ontgrendeld door de politie',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'Het voertuig %s is succesvol in beslag genomen.',
                ['ImpoundInfo'] = 'Je voertuig %s is in beslag genomen door de politie.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'Het voertuig %s kon niet in beslag worden genomen.',
                    ['NoOwner'] = 'Het voertuig %s heeft geen eigenaar.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Politie Depot',
            ['Menu'] = {
                ['Title'] = '🚓 Politie Depot',
                ['PoliceVehicleDesc'] = 'De eigenaar moet het voertuig ophalen',
                ['PoliceVehicleUnlockDesc'] = 'Klik om het voertuig te ontgrendelen',
                ['VehicleDesc'] = 'Klik om het voertuig uit te parkeren',
                ['VehicleUnlockDesc'] = 'Een agent moet het voertuig ontgrendelen',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Status',
                ['Owner'] = '🤵 Eigenaar',
                ['Officer'] = '👮 Agent',
                ['Modell'] = '🚗 Model',
                ['Plate'] = '🔢 Kenteken',
                ['Offence'] = '⚖️ Overtreding',
                ['Fine'] = '💰 Boete',
                ['Duration'] = '⏳ Duur',
                ['Note'] = '📝 Opmerking',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'Er staan geen voertuigen in het depot',
                ['PoliceVehicleUnlockSuccess'] = 'Het voertuig is succesvol ontgrendeld',
                ['ImpoundVehicleInvalid'] = 'Het in beslag genomen voertuig is ongeldig',
                ['ImpoundVehicleUnlockInfo'] = 'Je voertuig %s is ontgrendeld door de politie',
                ['ImpoundVehicleDuration'] = 'Je moet wachten tot %s om het voertuig uit te parkeren',
                ['ImpoundNotEnoughMoney'] = 'Je hebt niet genoeg geld om het voertuig uit te parkeren',
                ['ImpoundVehicleParkOut'] = 'Het voertuig is uitgeparkeerd',
            }
        }
    }
}
