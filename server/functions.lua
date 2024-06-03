---log
---@param message string
---@return void
---@public
function log(message)
	print("^5(^2" .. string.upper(GetCurrentResourceName()) .. "^5) ^4- ^0" .. message)
end

---doesFactionExist
---@param job string
---@param rank number
---@return boolean
---@public
function doesFactionExist(job, rank)
	local isValid = false
	for _job, datas in pairs(Config.factions) do
		if _job == job and datas.ranks[rank] then
			isValid = true
			return isValid
		end
	end
	return isValid
end

---setFaction
---@param source number
---@param job string
---@param rank number
---@param cb function
---@return void
---@public
function setFaction(source, job, rank, cb)
	if not source then
		cb(false)
		return
	end
	if not doesFactionExist(job, rank) then
		log(GetPlayerName(source) .. " tried to set a faction that doesn't exist")
		cb(false)
		return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then
		cb(false)
		return
	end
	xPlayer.setMeta("faction", {
		name = job,
		rank = rank,
		label = Config.factions[job].label,
		grade_label = Config.factions[job].ranks[rank],
	})
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
	local xPlayer = ESX.GetPlayerFromId(source)
	if not xPlayer then
		return Config.defaultFaction
	end
	return xPlayer.getMeta("faction") or Config.defaultFaction
end
