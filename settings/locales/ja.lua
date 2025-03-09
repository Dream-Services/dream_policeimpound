--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['ja'] = {
    ['NotifyHeader'] = '警察のインパウンド',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = '車両を押収',
            ['Dialog'] = {
                ['Title'] = '🚓 車両押収',
                ['Model'] = 'モデル',
                ['Plate'] = 'ナンバー',
                ['Officer'] = '警察官',
                ['Duration'] = '期間',
                ['Offence'] = '違反',
                ['OffencePlaceholder'] = '違反を選択',
                ['Fine'] = '罰金',
                ['Note'] = '追加のメモ',
                ['NeedUnlock'] = 'まず警察によって解除される必要があります',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = '車両 %s は押収されました。',
                ['ImpoundInfo'] = 'あなたの車両 %s は警察に押収されました。',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = '車両 %s を押収できませんでした。',
                    ['NoOwner'] = '車両 %s の所有者がいません。',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = '警察のインパウンド',
            ['Menu'] = {
                ['Title'] = '🚓 警察のインパウンド',
                ['PoliceVehicleDesc'] = '所有者が車両を回収する必要があります',
                ['PoliceVehicleUnlockDesc'] = 'クリックして車両のロックを解除',
                ['VehicleDesc'] = 'クリックして車両を取り出す',
                ['VehicleUnlockDesc'] = '警察官が車両のロックを解除する必要があります',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 状態',
                ['Owner'] = '🤵 所有者',
                ['Officer'] = '👮 警察官',
                ['Modell'] = '🚗 モデル',
                ['Plate'] = '🔢 ナンバー',
                ['Offence'] = '⚖️ 違反',
                ['Fine'] = '💰 罰金',
                ['Duration'] = '⏳ 期間',
                ['Note'] = '📝 メモ',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = '押収された車両はありません',
                ['PoliceVehicleUnlockSuccess'] = '車両のロックが解除されました',
                ['ImpoundVehicleInvalid'] = '無効な押収車両です',
                ['ImpoundVehicleUnlockInfo'] = 'あなたの車両 %s は警察によってロック解除されました',
                ['ImpoundVehicleDuration'] = '車両を取り出すには %s まで待つ必要があります',
                ['ImpoundNotEnoughMoney'] = '車両を取り出すのに十分なお金がありません',
                ['ImpoundVehicleParkOut'] = '車両が取り出されました',
            }
        }
    }
}
