local StateManager = {
	states = {},
	modules = {},
	activeState = nil
}

-- Sets the current state
---@param scene string
function StateManager:setState(scene)
	self.activeState = scene
end

--- Returns current state
---@return string
function StateManager:getState()
	return self.activeState
end

---Returns all the stored states
---@return table
function StateManager:getAllStates()
	return self.states
end

-- Add a state to state manager
---@param state string
function StateManager:addState(state)
	table.insert(self.states, state)
end

---Execute a function of current state/module, self is passed as first argument.
---@param method any name of the function you want to execute
---@param ... any arguments we want to pass
function StateManager:execute(method, ...)
	if self.modules[self.activeState] and self.modules[self.activeState][method] then
		self.modules[self.activeState][method](self.modules[self.activeState], ...)
	end
end

--- StateManager will require states/modules and call the load function if possible.
function StateManager:load()
	if #self.states == 0 then error("No states/modules present, use State:addState(\"state\") to add a state") end
	if not self.activeState then error("State:setState(\"state\") not set") end
	for _, state in ipairs(self.states) do
		self.modules[state] = require(state)
		if self.modules[state].load then
			self.modules[state]:load()
		end
	end
end

--- Events & arguments we want to call.
---@param event string
---@param ... any
function StateManager:call(event, ...)
	local module = self.modules[self.activeState]
	if module[event] then
		module[event](module, ...)
	end
end

return StateManager
