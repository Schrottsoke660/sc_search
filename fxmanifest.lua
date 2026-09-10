fx_version 'cerulean'
game 'gta5'

author 'RLC Script'
description 'Player Search System with ox_inventory'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'es_extended',
    'ox_inventory'
}