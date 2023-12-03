fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lolex (GROVE SCRIPTS), Sarmingo (SarmingoDev), vulegg (GG SCRIPTS)'

description 'An farmer job'

client_script 'client/main.lua'

server_script 'server/main.lua'

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'locales/*.lua',
    'lib/functions.lua',
    '@ox_lib/init.lua'
}

dependencies {
    'es_extended',
    'ox_lib',
}

ui_page('nui/nui.html')

files {
    'nui/nui.html',
    'nui/style.css',
    'nui/script.js',
    'nui/images/*',
}