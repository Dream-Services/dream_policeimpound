--[[
    Thank you for using our script. We are happy to have you here. If you need help, you can join our Discord server.
    https://discord.gg/zppUXj4JRm
]]

DreamLocales = {} -- Do not touch this!!!
DreamFramework = {} -- Do not touch this!!!
DreamCore = {} -- Do not touch this!!!

-- Dream Police Impound Settings
DreamCore.Language = 'en'
DreamCore.GiveCredits = true -- Set to false if you don't want to give credits

DreamCore.ImpoundStatusIconColor = {
    [2] = '#d4af37',
    [3] = '#374f6b',
}
DreamCore.ImpoundDurationFormat = '%d.%m.%Y %H:%M:%S'
DreamCore.ImpoundStations = {
    {
        label = 'Police Impound',
        coords = vector3(408.9779, -1622.7163, 29.2919),
        ped = {
            model = 's_m_y_cop_01',
            coords = vector3(408.9779, -1622.7163, 28.2919),
            heading = 227.8904,
        },
        blip = {
            sprite = 67,
            color = 68,
            label = 'Police Impound',
        },
        parkout = {
            coords = vector3(405.2425, -1644.0477, 28.2919),
            heading = 228.4430,
        }
    }

    -- Add more Impound Stations here
}
DreamCore.ImpoundForm = {
    DateFormat = "DD.MM.YYYY",
    CustomFineAmount = false,
    DisableInput = {
        officer = true,
        model = false,
        plate = false,
    }
}
