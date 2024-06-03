ESX.RegisterCommand(
	{ "setfaction", "setjob2", "setgang", "setorga" },
	Config.admins,
	function(xPlayer, args, _)
		setFaction(args.player.source, args.faction, args.rank, function(success)
			xPlayer.showNotification(success and _U("notif_setfaction_success", GetPlayerName(args.player.source), args.job, args.rank) or _U("notif_setfaction_error", GetPlayerName(args.player.source)))
		end)
	end,
	true,
	{
		help = _U("command_setfaction_help"),
		arguments = {
			{ name = "player", help = _U("command_setfaction_args_player"), type = "player" },
			{ name = "faction", help = _U("command_setfaction_args_faction"), type = "string" },
			{ name = "rank", help = _U("command_setfaction_args_rank"), type = "number" },
		},
	}
)
