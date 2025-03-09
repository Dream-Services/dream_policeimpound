--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['es'] = {
    ['NotifyHeader'] = 'Depósito Policial',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Confiscar vehículo',
            ['Dialog'] = {
                ['Title'] = '🚓 Depósito de Vehículos',
                ['Model'] = 'Modelo',
                ['Plate'] = 'Matrícula',
                ['Officer'] = 'Oficial',
                ['Duration'] = 'Duración',
                ['Offence'] = 'Infracción',
                ['OffencePlaceholder'] = 'Selecciona una infracción',
                ['Fine'] = 'Multa',
                ['Note'] = 'Nota adicional',
                ['NeedUnlock'] = 'Debe ser desbloqueado primero por la policía',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'El vehículo %s fue confiscado con éxito.',
                ['ImpoundInfo'] = 'Tu vehículo %s fue confiscado por la policía.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'El vehículo %s no pudo ser confiscado.',
                    ['NoOwner'] = 'El vehículo %s no tiene propietario.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Depósito Policial',
            ['Menu'] = {
                ['Title'] = '🚓 Depósito Policial',
                ['PoliceVehicleDesc'] = 'El propietario debe recoger el vehículo',
                ['PoliceVehicleUnlockDesc'] = 'Haz clic para desbloquear el vehículo',
                ['VehicleDesc'] = 'Haz clic para sacar el vehículo',
                ['VehicleUnlockDesc'] = 'Un oficial debe desbloquear el vehículo',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Estado',
                ['Owner'] = '🤵 Propietario',
                ['Officer'] = '👮 Oficial',
                ['Modell'] = '🚗 Modelo',
                ['Plate'] = '🔢 Matrícula',
                ['Offence'] = '⚖️ Infracción',
                ['Fine'] = '💰 Multa',
                ['Duration'] = '⏳ Duración',
                ['Note'] = '📝 Nota',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'No hay vehículos en el depósito',
                ['PoliceVehicleUnlockSuccess'] = 'El vehículo fue desbloqueado con éxito',
                ['ImpoundVehicleInvalid'] = 'El vehículo confiscado no es válido',
                ['ImpoundVehicleUnlockInfo'] = 'Tu vehículo %s fue desbloqueado por la policía',
                ['ImpoundVehicleDuration'] = 'Debes esperar hasta %s para sacar el vehículo',
                ['ImpoundNotEnoughMoney'] = 'No tienes suficiente dinero para sacar el vehículo',
                ['ImpoundVehicleParkOut'] = 'El vehículo ha sido sacado',
            }
        }
    }
}
