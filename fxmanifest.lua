-- Do not change anything in this file if you do not know what you are doing!

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Dream Services | Tuncion'
description 'https://discord.gg/zppUXj4JRm'
version '1.0.1.2'
patch '#15'
released '21.03.2025, 22:51 by Tuncion'

client_scripts {
    'bridge/**/client.lua',
    'client/functions.lua',
    'client/main.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'settings/DreamCore.lua',
    'settings/locales/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'settings/DreamCoreExt.lua',
    'bridge/**/server.lua',
    'server/main.lua'
}

escrow_ignore {
    'settings/',
    'bridge/',
}

dependencies {
    'ox_lib'
}
