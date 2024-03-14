local Test = {x = 0, y = 200, text = "Test, press space to switch scene", dir = 1, speed = 200}
local StateManager = require("state")

local font = love.graphics.getFont()
local WW, WH = love.graphics.getDimensions()

function Test:load()
	print("Test Loaded")
end

function Test:draw()
	love.graphics.print(self.text, self.x, self.y)
end

function Test:update(dt)
	if self.x + font:getWidth(self.text) > WW then
		self.dir = -1
		self.x = WW - font:getWidth(self.text)
	elseif self.x < 0 then
		self.dir = 1
		self.x = 0
	end

	self.x = (self.x + (self.speed * self.dir) * dt)
end

function Test:keypressed(key, scancode, isrepeat)
	if scancode == "space" then
		StateManager:setState("game")
	end
	if scancode == "l" then
		StateManager:call("load")
	end
end

return Test