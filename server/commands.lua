ESX.RegisterCommand(
	{ "setfaction", "setjob2", "setgang", "setorga" },
	Config.admins,
	function(xPlayer, args, _)
		setFaction(args.player.source, args.faction, args.grade, function(success)
			xPlayer.showNotification(success and _U("notif_setfaction_success", GetPlayerName(args.player.source), args.faction, args.grade) or _U("notif_setfaction_error", GetPlayerName(args.player.source)))
		end)
	end,
	true,
	{
		help = _U("command_setfaction_help"),
		arguments = {
			{ name = "player", help = _U("command_args_player"), type = "player" },
			{ name = "faction", help = _U("command_setfaction_args_faction"), type = "string" },
			{ name = "grade", help = _U("command_setfaction_args_grade"), type = "number" },
		},
	}
)

ESX.RegisterCommand(
	{ "getfaction", "getjob2", "getgang", "getorga" },
	Config.admins,
	function(xPlayer, args, _)
		local faction = getFaction(args.player.source)
		TriggerClientEvent("chat:addMessage", xPlayer.source, {
			args = { string.upper(GetCurrentResourceName()), _U("chat_getfaction", faction.label, faction.grade_label) },
		})
	end,
	true,
	{
		help = _U("command_setfaction_help"),
		arguments = {
			{ name = "player", help = _U("command_args_player"), type = "player" },
		},
	}
)
