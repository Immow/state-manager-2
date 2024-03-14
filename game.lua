local Game = { x = 0, y = 200, text = "Game, press space to switch scene", dir = 1, speed = 200 }
local font = love.graphics.getFont()
local WW, WH = love.graphics.getDimensions()

function Game:load()
	print("Game Loaded")
end

function Game:draw()
	love.graphics.print(self.text, self.x, self.y)
end

function Game:update(dt)
	if self.x + font:getWidth(self.text) > WW then
		self.dir = -1
		self.x = WW - font:getWidth(self.text)
	elseif self.x < 0 then
		self.dir = 1
		self.x = 0
	end
	self.x = (self.x + (self.speed * self.dir) * dt)
end

function Game:keypressed(key, scancode, isrepeat)
	if scancode == "space" then
		StateManager:setState("mainmenu")
	end
end

return Game
