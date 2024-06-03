ESX.RegisterCommand(
	{ "setfaction", "setjob2", "setgang", "setorga" },
	Config.admins,
	function(xPlayer, args, _)
		setFaction(args.player.source, args.job, args.rank, function(success)
			xPlayer.showNotification(success and _U("notif_setfaction_success", GetPlayerName(args.player.source), args.job, args.rank) or _U("notif_setfaction_error", GetPlayerName(args.player.source)))
		end)
	end,
	true,
	{
		help = _U("command_setfaction_help"),
		arguments = {
			{ name = "player", help = "Joueur cible", type = "player" },
			{ name = "job", help = "Nouveau faction", type = "string" },
			{ name = "rank", help = "Nouveau grade de faction", type = "number" },
		},
	}
)
