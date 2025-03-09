--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['pt'] = {
    ['NotifyHeader'] = 'Pátio da Polícia',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Apreender veículo',
            ['Dialog'] = {
                ['Title'] = '🚓 Apreensão de Veículo',
                ['Model'] = 'Modelo',
                ['Plate'] = 'Placa',
                ['Officer'] = 'Oficial',
                ['Duration'] = 'Duração',
                ['Offence'] = 'Infração',
                ['OffencePlaceholder'] = 'Selecione uma infração',
                ['Fine'] = 'Multa',
                ['Note'] = 'Nota adicional',
                ['NeedUnlock'] = 'Precisa ser desbloqueado primeiro pela polícia',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'O veículo %s foi apreendido com sucesso.',
                ['ImpoundInfo'] = 'Seu veículo %s foi apreendido pela polícia.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'O veículo %s não pôde ser apreendido.',
                    ['NoOwner'] = 'O veículo %s não tem proprietário.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Pátio da Polícia',
            ['Menu'] = {
                ['Title'] = '🚓 Pátio da Polícia',
                ['PoliceVehicleDesc'] = 'O proprietário deve buscar o veículo',
                ['PoliceVehicleUnlockDesc'] = 'Clique para desbloquear o veículo',
                ['VehicleDesc'] = 'Clique para retirar o veículo',
                ['VehicleUnlockDesc'] = 'Um oficial precisa desbloquear o veículo',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Status',
                ['Owner'] = '🤵 Proprietário',
                ['Officer'] = '👮 Oficial',
                ['Modell'] = '🚗 Modelo',
                ['Plate'] = '🔢 Placa',
                ['Offence'] = '⚖️ Infração',
                ['Fine'] = '💰 Multa',
                ['Duration'] = '⏳ Duração',
                ['Note'] = '📝 Nota',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'Não há veículos no pátio',
                ['PoliceVehicleUnlockSuccess'] = 'O veículo foi desbloqueado com sucesso',
                ['ImpoundVehicleInvalid'] = 'O veículo apreendido é inválido',
                ['ImpoundVehicleUnlockInfo'] = 'Seu veículo %s foi desbloqueado pela polícia',
                ['ImpoundVehicleDuration'] = 'Você precisa esperar até %s para retirar o veículo',
                ['ImpoundNotEnoughMoney'] = 'Você não tem dinheiro suficiente para retirar o veículo',
                ['ImpoundVehicleParkOut'] = 'O veículo foi retirado',
            }
        }
    }
}
