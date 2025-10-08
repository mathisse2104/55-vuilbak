fx_version 'cerulean'
game 'gta5'

author '55 Development'
description '55 vuilbak script'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    'shared.lua'
}

dependency {
    'ox_inventory',
    'ox_lib',
    'ox_target'
}
