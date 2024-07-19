local Game = {}
local Button = require("button")

local Buttons = {
	Button.new({
		x = 100,
		y = 100,
		text = "Main Menu",
		fn = function()
			StateManager:setState("mainmenu")
		end
	})
}

function Game:load()
	print("Game module loaded")
end

function Game:mousepressed(mx, my, mouseButton)
	for _, button in ipairs(Buttons) do
		button:mousepressed(mx, my, mouseButton)
	end
end

function Game:draw()
	for _, button in ipairs(Buttons) do
		button:draw()
	end
	love.graphics.setFont(StateFont)
	love.graphics.print("Game File")
	love.graphics.setFont(DefaultFont)
end

function Game:update(dt)
	for _, button in ipairs(Buttons) do
		button:update(dt)
	end
end

return Game
