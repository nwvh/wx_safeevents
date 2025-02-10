-- [[ Resource Info ]]

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '2.0.0'
author 'wx / woox'
description 'Simple FiveM Safe Events'


-- [[ Client-Side Files ]]

client_scripts {
    'client/*.lua'
}

-- [[ Server-Side Files ]]

server_scripts {
    'server/*.lua',
    'config/*.lua',
}

shared_script 'shared/shared.lua'
