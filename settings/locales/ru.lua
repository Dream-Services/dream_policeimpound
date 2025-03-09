--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales['ru'] = {
    ['NotifyHeader'] = 'Полицейская штрафстоянка',

    ['GlobalVehicle'] = {
        ['ImpoundTarget'] = {
            ['Name'] = 'Забрать автомобиль',
            ['Dialog'] = {
                ['Title'] = '🚓 Изъятие автомобиля',
                ['Model'] = 'Модель',
                ['Plate'] = 'Номер',
                ['Officer'] = 'Офицер',
                ['Duration'] = 'Срок',
                ['Offence'] = 'Нарушение',
                ['OffencePlaceholder'] = 'Выберите нарушение',
                ['Fine'] = 'Штраф',
                ['Note'] = 'Дополнительная заметка',
                ['NeedUnlock'] = 'Сначала должен быть разблокирован полицией',
            },
            ['Notify'] = {
                ['ImpoundSuccess'] = 'Автомобиль %s успешно изъят.',
                ['ImpoundInfo'] = 'Ваш автомобиль %s был изъят полицией.',
                ['ImpoundFail'] = {
                    ['WrongIdentifer'] = 'Автомобиль %s не может быть изъят.',
                    ['NoOwner'] = 'Автомобиль %s не имеет владельца.',
                }
            }
        }
    },
    ['LocalEntity'] = {
        ['ImpoundStation'] = {
            ['Name'] = 'Полицейская штрафстоянка',
            ['Menu'] = {
                ['Title'] = '🚓 Полицейская штрафстоянка',
                ['PoliceVehicleDesc'] = 'Владелец должен забрать автомобиль',
                ['PoliceVehicleUnlockDesc'] = 'Нажмите, чтобы разблокировать автомобиль',
                ['VehicleDesc'] = 'Нажмите, чтобы забрать автомобиль',
                ['VehicleUnlockDesc'] = 'Офицер должен разблокировать автомобиль',
            },
            ['VehicleMetadata'] = {
                ['Status'] = '🚨 Статус',
                ['Owner'] = '🤵 Владелец',
                ['Officer'] = '👮 Офицер',
                ['Modell'] = '🚗 Модель',
                ['Plate'] = '🔢 Номер',
                ['Offence'] = '⚖️ Нарушение',
                ['Fine'] = '💰 Штраф',
                ['Duration'] = '⏳ Срок',
                ['Note'] = '📝 Заметка',
            },
            ['Notify'] = {
                ['NoImpoundVehicles'] = 'На штрафстоянке нет автомобилей',
                ['PoliceVehicleUnlockSuccess'] = 'Автомобиль успешно разблокирован',
                ['ImpoundVehicleInvalid'] = 'Неверный автомобиль для изъятия',
                ['ImpoundVehicleUnlockInfo'] = 'Ваш автомобиль %s был разблокирован полицией',
                ['ImpoundVehicleDuration'] = 'Вы должны подождать до %s, чтобы забрать автомобиль',
                ['ImpoundNotEnoughMoney'] = 'У вас недостаточно денег, чтобы забрать автомобиль',
                ['ImpoundVehicleParkOut'] = 'Автомобиль забран',
            }
        }
    }
}
