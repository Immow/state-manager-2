-- LuaFormatter off

local bla = {}
bla.__index = bla

---@class bla
---@param settings {x: integer, y: integer, w: integer, h: integer}
function bla.new(settings)
	local instance = setmetatable({}, bla)
	instance.x      = settings.x or 0
	instance.y      = settings.y or 0
	instance.w      = settings.w or 100
	instance.h      = settings.h or 50
	return instance
end

-- LuaFormatter on

function bla:update(dt)

end

function bla:draw()

end

return bla