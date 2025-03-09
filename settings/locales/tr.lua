--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['tr'] = {
    ['NotifyHeader'] = 'Polis Otoparkı',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Aracı bağla',
            ['Dialog'] = {
                ['Title'] = '🚓 Araç Bağlama',
                ['Model'] = 'Model',
                ['Plate'] = 'Plaka',
                ['Officer'] = 'Memur',
                ['Duration'] = 'Süre',
                ['Offence'] = 'Suç',
                ['OffencePlaceholder'] = 'Bir suç seçin',
                ['Fine'] = 'Ceza',
                ['Note'] = 'Ekstra Not',
                ['NeedUnlock'] = 'Önce polis tarafından kilidi açılmalı',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = '%s aracı başarıyla bağlandı.',
                ['ImpoundInfo'] = '%s aracınız polis tarafından bağlandı.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = '%s aracı bağlanamadı.',
                    ['NoOwner'] = '%s aracının sahibi yok.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Polis Otoparkı',
            ['Menu'] = {
                ['Title'] = '🚓 Polis Otoparkı',
                ['PoliceVehicleDesc'] = 'Araç sahibi aracı almalıdır',
                ['PoliceVehicleUnlockDesc'] = 'Aracın kilidini açmak için tıklayın',
                ['VehicleDesc'] = 'Aracı çıkarmak için tıklayın',
                ['VehicleUnlockDesc'] = 'Bir memur aracı açmalıdır',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Durum',
                ['Owner'] = '🤵 Sahip',
                ['Officer'] = '👮 Memur',
                ['Modell'] = '🚗 Model',
                ['Plate'] = '🔢 Plaka',
                ['Offence'] = '⚖️ Suç',
                ['Fine'] = '💰 Ceza',
                ['Duration'] = '⏳ Süre',
                ['Note'] = '📝 Not',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'Bağlı araç yok',
                ['PoliceVehicleUnlockSuccess'] = 'Araç başarıyla açıldı',
                ['ImpoundVehicleInvalid'] = 'Bağlı araç geçersiz',
                ['ImpoundVehicleUnlockInfo'] = '%s aracınız polis tarafından açıldı',
                ['ImpoundVehicleDuration'] = 'Aracı çıkarmak için %s saatine kadar beklemelisiniz',
                ['ImpoundNotEnoughMoney'] = 'Aracı çıkarmak için yeterli paranız yok',
                ['ImpoundVehicleParkOut'] = 'Araç çıkartıldı',
            }
        }
    }
}
