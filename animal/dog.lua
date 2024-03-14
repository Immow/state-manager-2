local Dog = {x = 0, y = 200, text = "Dog, press space to switch scene", dir = 1, speed = 200}
local StateManager = require("state")

local font = love.graphics.getFont()
local WW, WH = love.graphics.getDimensions()

function Dog:load()
	print("Dog Loaded")
end

function Dog:draw()
	love.graphics.print(self.text, self.x, self.y)
end

function Dog:update(dt)
	if self.x + font:getWidth(self.text) > WW then
		self.dir = -1
		self.x = WW - font:getWidth(self.text)
	elseif self.x < 0 then
		self.dir = 1
		self.x = 0
	end
	self.x = (self.x + (self.speed * self.dir) * dt)
end

function Dog:keypressed(key, scancode, isrepeat)
	if scancode == "space" then
		StateManager:setState("test")
	end
end

return Dog