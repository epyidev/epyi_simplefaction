Config = {}
Config.locale = "en"

Config.admins = { "admin" }
Config.defaultFaction = {
	name = "unemployed2",
	label = "No faction",
	grade = 0,
	grade_label = "No faction",
}

Config.factions = {
	["ballas"] = {
		label = "Ballas",
		grades = {
			[0] = "Recruit",
			[1] = "Ballas",
			[2] = "OG",
		},
	},
	["example"] = {
		label = "Example",
		grades = {
			[0] = "Recruit",
			[1] = "Member",
			[2] = "Officer",
			[3] = "Leader",
		},
	},
}
