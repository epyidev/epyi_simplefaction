---log
---@param message string
---@return void
---@public
function log(message)
	print("^5(^2" .. string.upper(GetCurrentResourceName()) .. "^5) ^4- ^0" .. message)
end

---doesFactionExist
---@param faction string
---@param grade number
---@return boolean
---@public
function doesFactionExist(faction, grade)
	local isValid = false
	for _faction, datas in pairs(Config.factions) do
		if _faction == faction and datas.grades[grade] then
			isValid = true
			return isValid
		end
	end
	return isValid
end

---setFaction
---@param source number
---@param faction string
---@param grade number
---@param cb function
---@return void
---@public
function setFaction(source, faction, grade, cb)
	if not source then
		cb(false)
		return
	end
	local isDefault = false
	if faction == Config.defaultFaction.name and grade == Config.defaultFaction.grade then
		isDefault = true
	end
	if not isDefault and not doesFactionExist(faction, grade) then
		log(GetPlayerName(source) .. " tried to set a faction that doesn't exist")
		cb(false)
		return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then
		cb(false)
		return
	end
	local _faction = {
		name = faction,
		grade = grade,
		label = isDefault and Config.defaultFaction.label or Config.factions[faction].label,
		grade_label = isDefault and Config.defaultFaction.grade_label or Config.factions[faction].grades[grade],
	}
	xPlayer.setMeta("faction", _faction)
	TriggerEvent("epyi_simplefaction:setFaction", source, _faction)
	cb(true)
end

---getFaction
---@param source number
---@return table
---@public
function getFaction(source)
	if not source then
		return Config.defaultFaction
	end
	local state = Player(source).state
	if not state or not state.metadata or not state.metadata.faction then
		return Config.defaultFaction
	end
	return state.metadata.faction
end
