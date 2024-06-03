---getFaction
---@return table
---@public
function getFaction()
	local state = LocalPlayer.state
	if not state or not state.faction then
		return Config.defaultFaction
	end
	return state.faction
end
