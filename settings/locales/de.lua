--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['de'] = {
    ['NotifyHeader'] = 'Polizei Abschlepphof',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Fahrzeug abschleppen',
            ['Dialog'] = {
                ['Title'] = '🚓 Fahrzeug Abschlepphof',
                ['Model'] = 'Modell',
                ['Plate'] = 'Kennzeichen',
                ['Officer'] = 'Beamter',
                ['Duration'] = 'Dauer',
                ['Offence'] = 'Vergehen',
                ['OffencePlaceholder'] = 'Wähle ein Vergehen',
                ['Fine'] = 'Strafe',
                ['Note'] = 'Zusätzliche Notiz',
                ['NeedUnlock'] = 'Muss zuerst vom LSPD freigeschaltet werden',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'Das Fahrzeug %s wurde erfolgreich abgeschleppt.',
                ['ImpoundInfo'] = 'Dein Fahrzeug %s wurde von der Polizei abgeschleppt.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'Das Fahrzeug %s konnte nicht abgeschleppt werden.',
                    ['NoOwner'] = 'Das Fahrzeug %s hat keinen Besitzer.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Polizei Abschlepphof',
            ['Menu'] = {
                ['Title'] = '🚓 Polizei Abschlepphof',
                ['PoliceVehicleDesc'] = 'Der Besitzer muss das Fahrzeug abholen',
                ['PoliceVehicleUnlockDesc'] = 'Klicke, um das Fahrzeug zu entsperren',
                ['VehicleDesc'] = 'Klicke, um das Fahrzeug auszuparken',
                ['VehicleUnlockDesc'] = 'Ein Beamter muss das Fahrzeug entsperren',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Status',
                ['Owner'] = '🤵 Besitzer',
                ['Officer'] = '👮 Beamter',
                ['Modell'] = '🚗 Modell',
                ['Plate'] = '🔢 Kennzeichen',
                ['Offence'] = '⚖️ Vergehen',
                ['Fine'] = '💰 Strafe',
                ['Duration'] = '⏳ Dauer',
                ['Note'] = '📝 Notiz',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'Es gibt keine Fahrzeuge im Abschlepphof',
                ['PoliceVehicleUnlockSuccess'] = 'Das Fahrzeug wurde erfolgreich entsperrt',
                ['ImpoundVehicleInvalid'] = 'Das abgeschleppte Fahrzeug ist ungültig',
                ['ImpoundVehicleUnlockInfo'] = 'Dein Fahrzeug %s wurde von der Polizei entsperrt',
                ['ImpoundVehicleDuration'] = 'Du musst bis %s warten, um das Fahrzeug auszuparken',
                ['ImpoundNotEnoughMoney'] = 'Du hast nicht genug Geld, um das Fahrzeug auszuparken',
                ['ImpoundVehicleParkOut'] = 'Das Fahrzeug wurde ausgeparkt',
            }
        }
    }
}
