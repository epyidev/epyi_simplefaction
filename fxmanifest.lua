fx_version("cerulean")
game("gta5")

description("Simple faction system for ESX")
author("Epyi")
version("1.0.4")
lua54("yes")

shared_scripts({
	"@es_extended/imports.lua",
	"shared/locale.lua",
	"locales/*.lua",
	"config.lua",
})

client_scripts({
	"client/functions.lua",
	"client/exports.lua",
})

server_scripts({
	"server/version_check.lua",
	"server/functions.lua",
	"server/commands.lua",
	"server/exports.lua",
})
