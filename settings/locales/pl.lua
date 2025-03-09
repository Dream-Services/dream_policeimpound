--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['pl'] = {
    ['NotifyHeader'] = 'Policyjny Parking',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Zajmij pojazd',
            ['Dialog'] = {
                ['Title'] = '🚓 Zajęcie Pojazdu',
                ['Model'] = 'Model',
                ['Plate'] = 'Tablica',
                ['Officer'] = 'Funkcjonariusz',
                ['Duration'] = 'Czas',
                ['Offence'] = 'Wykroczenie',
                ['OffencePlaceholder'] = 'Wybierz wykroczenie',
                ['Fine'] = 'Grzywna',
                ['Note'] = 'Dodatkowa notatka',
                ['NeedUnlock'] = 'Najpierw musi zostać odblokowane przez policję',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'Pojazd %s został pomyślnie zajęty.',
                ['ImpoundInfo'] = 'Twój pojazd %s został zajęty przez policję.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'Pojazd %s nie mógł zostać zajęty.',
                    ['NoOwner'] = 'Pojazd %s nie ma właściciela.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Policyjny Parking',
            ['Menu'] = {
                ['Title'] = '🚓 Policyjny Parking',
                ['PoliceVehicleDesc'] = 'Właściciel musi odebrać pojazd',
                ['PoliceVehicleUnlockDesc'] = 'Kliknij, aby odblokować pojazd',
                ['VehicleDesc'] = 'Kliknij, aby wyciągnąć pojazd',
                ['VehicleUnlockDesc'] = 'Funkcjonariusz musi odblokować pojazd',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Status',
                ['Owner'] = '🤵 Właściciel',
                ['Officer'] = '👮 Funkcjonariusz',
                ['Modell'] = '🚗 Model',
                ['Plate'] = '🔢 Tablica',
                ['Offence'] = '⚖️ Wykroczenie',
                ['Fine'] = '💰 Grzywna',
                ['Duration'] = '⏳ Czas',
                ['Note'] = '📝 Notatka',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'Na parkingu nie ma żadnych pojazdów',
                ['PoliceVehicleUnlockSuccess'] = 'Pojazd został pomyślnie odblokowany',
                ['ImpoundVehicleInvalid'] = 'Nieprawidłowy pojazd do zajęcia',
                ['ImpoundVehicleUnlockInfo'] = 'Twój pojazd %s został odblokowany przez policję',
                ['ImpoundVehicleDuration'] = 'Musisz poczekać do %s, aby wyciągnąć pojazd',
                ['ImpoundNotEnoughMoney'] = 'Nie masz wystarczająco pieniędzy, aby wyciągnąć pojazd',
                ['ImpoundVehicleParkOut'] = 'Pojazd został wyciągnięty',
            }
        }
    }
}
