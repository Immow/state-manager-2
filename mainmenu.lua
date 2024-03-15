local MainMenu = {}
local Button = require("button")

local Buttons = {
	Button.new({ x = 100, y = 100, text = "Load Game", fn = function() StateManager:setState("game") end }),
	Button.new({
		x = 100,
		y = 200,
		text = "Load Test",
		fn = function()
			StateManager:setState("test")
			StateManager:execute("test", "cow", "Mooooooooo")
		end
	})
}

function MainMenu:mousepressed(mx, my, mouseButton)
	for _, button in ipairs(Buttons) do
		button:mousepressed(mx, my, mouseButton)
	end
end

function MainMenu:draw()
	for _, button in ipairs(Buttons) do
		button:draw()
	end
end

function MainMenu:update(dt)
	for _, button in ipairs(Buttons) do
		button:update(dt)
	end
end

return MainMenu
