--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['it'] = {
    ['NotifyHeader'] = 'Deposito di Polizia',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Sequestra veicolo',
            ['Dialog'] = {
                ['Title'] = '🚓 Deposito Veicoli',
                ['Model'] = 'Modello',
                ['Plate'] = 'Targa',
                ['Officer'] = 'Ufficiale',
                ['Duration'] = 'Durata',
                ['Offence'] = 'Infrazione',
                ['OffencePlaceholder'] = 'Seleziona un’infrazione',
                ['Fine'] = 'Multa',
                ['Note'] = 'Nota aggiuntiva',
                ['NeedUnlock'] = 'Deve essere sbloccato prima dalla polizia',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'Il veicolo %s è stato sequestrato con successo.',
                ['ImpoundInfo'] = 'Il tuo veicolo %s è stato sequestrato dalla polizia.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'Il veicolo %s non può essere sequestrato.',
                    ['NoOwner'] = 'Il veicolo %s non ha proprietario.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Deposito di Polizia',
            ['Menu'] = {
                ['Title'] = '🚓 Deposito di Polizia',
                ['PoliceVehicleDesc'] = 'Il proprietario deve ritirare il veicolo',
                ['PoliceVehicleUnlockDesc'] = 'Clicca per sbloccare il veicolo',
                ['VehicleDesc'] = 'Clicca per recuperare il veicolo',
                ['VehicleUnlockDesc'] = 'Un ufficiale deve sbloccare il veicolo',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Stato',
                ['Owner'] = '🤵 Proprietario',
                ['Officer'] = '👮 Ufficiale',
                ['Modell'] = '🚗 Modello',
                ['Plate'] = '🔢 Targa',
                ['Offence'] = '⚖️ Infrazione',
                ['Fine'] = '💰 Multa',
                ['Duration'] = '⏳ Durata',
                ['Note'] = '📝 Nota',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'Non ci sono veicoli nel deposito',
                ['PoliceVehicleUnlockSuccess'] = 'Il veicolo è stato sbloccato con successo',
                ['ImpoundVehicleInvalid'] = 'Il veicolo sequestrato non è valido',
                ['ImpoundVehicleUnlockInfo'] = 'Il tuo veicolo %s è stato sbloccato dalla polizia',
                ['ImpoundVehicleDuration'] = 'Devi aspettare fino a %s per recuperare il veicolo',
                ['ImpoundNotEnoughMoney'] = 'Non hai abbastanza soldi per recuperare il veicolo',
                ['ImpoundVehicleParkOut'] = 'Il veicolo è stato recuperato',
            }
        }
    }
}
