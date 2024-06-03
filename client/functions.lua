---getFaction
---@return table
---@public
function getFaction()
	local state = LocalPlayer.state
	if not state or not state.metadata or not state.metadata.faction then
		return Config.defaultFaction
	end
	return state.metadata.faction
end
