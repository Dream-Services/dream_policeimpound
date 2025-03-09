--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['fr'] = {
    ['NotifyHeader'] = 'Fourrière de Police',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Mettre en fourrière',
            ['Dialog'] = {
                ['Title'] = '🚓 Fourrière de Véhicules',
                ['Model'] = 'Modèle',
                ['Plate'] = 'Plaque',
                ['Officer'] = 'Officier',
                ['Duration'] = 'Durée',
                ['Offence'] = 'Infraction',
                ['OffencePlaceholder'] = 'Sélectionner une infraction',
                ['Fine'] = 'Amende',
                ['Note'] = 'Note supplémentaire',
                ['NeedUnlock'] = 'Doit d’abord être déverrouillé par la police',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'Le véhicule %s a été mis en fourrière avec succès.',
                ['ImpoundInfo'] = 'Votre véhicule %s a été mis en fourrière par la police.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'Le véhicule %s n’a pas pu être mis en fourrière.',
                    ['NoOwner'] = 'Le véhicule %s n’a pas de propriétaire.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Fourrière de Police',
            ['Menu'] = {
                ['Title'] = '🚓 Fourrière de Police',
                ['PoliceVehicleDesc'] = 'Le propriétaire doit récupérer le véhicule',
                ['PoliceVehicleUnlockDesc'] = 'Cliquer pour déverrouiller le véhicule',
                ['VehicleDesc'] = 'Cliquer pour sortir le véhicule',
                ['VehicleUnlockDesc'] = 'Un officier doit déverrouiller le véhicule',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Statut',
                ['Owner'] = '🤵 Propriétaire',
                ['Officer'] = '👮 Officier',
                ['Modell'] = '🚗 Modèle',
                ['Plate'] = '🔢 Plaque',
                ['Offence'] = '⚖️ Infraction',
                ['Fine'] = '💰 Amende',
                ['Duration'] = '⏳ Durée',
                ['Note'] = '📝 Note',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'Il n’y a aucun véhicule en fourrière',
                ['PoliceVehicleUnlockSuccess'] = 'Le véhicule a été déverrouillé avec succès',
                ['ImpoundVehicleInvalid'] = 'Le véhicule en fourrière est invalide',
                ['ImpoundVehicleUnlockInfo'] = 'Votre véhicule %s a été déverrouillé par la police',
                ['ImpoundVehicleDuration'] = 'Vous devez attendre jusqu’à %s pour sortir le véhicule',
                ['ImpoundNotEnoughMoney'] = 'Vous n’avez pas assez d’argent pour sortir le véhicule',
                ['ImpoundVehicleParkOut'] = 'Le véhicule a été sorti',
            }
        }
    }
}
