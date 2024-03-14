local Button = {}
Button.__index = Button

local buttons = {}
function Button.new(settings)
	local instance  = setmetatable({}, Button)
	instance.x      = settings.x or 0
	instance.y      = settings.y or 0
	instance.width  = settings.width or 200
	instance.height = settings.height or 75
	instance.text   = settings.text or "myButton"
	instance.hover  = false
	instance.fn     = settings.fn or function() print(instance.text) end

	return instance
end

function Button:isMouseOnButton(mx, my)
	local xRegion = self.x <= mx and self.x + self.width >= mx
	local yRegion = self.y <= my and self.y + self.height >= my
	return xRegion and yRegion
end

function Button:mousepressed(mx, my, mouseButton)
	if mouseButton ~= 1 then return end
	local hovered = self:isMouseOnButton(mx, my)
	if hovered then
		self.fn()
	end
end

function Button:draw()
	if self.hover then
		love.graphics.setColor(1, 0, 0)
	else
		love.graphics.setColor(1, 1, 1)
	end
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
	love.graphics.print(self.text, self.x, self.y)
	love.graphics.setColor(1, 1, 1)
end

function Button:update(dt)
	local mx, my = love.mouse.getPosition()
	if self:isMouseOnButton(mx, my) then
		self.hover = true
	else
		self.hover = false
	end
end

return Button
