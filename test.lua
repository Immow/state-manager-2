local Test = {}
local Button = require("button")

local Buttons = {
	Button.new({
		x = 100,
		y = 100,
		text = "Moo",
		fn = function()
			StateManager:execute("cow", "Mooooooooo")
		end
	}),
	Button.new({
		x = 100,
		y = 200,
		text = "Main Menu",
		fn = function()
			StateManager:setState("mainmenu")
		end
	})
}

function Test:cow(arg)
	print(arg)
end

function Test:mousepressed(mx, my, mouseButton)
	for _, button in ipairs(Buttons) do
		button:mousepressed(mx, my, mouseButton)
	end
end

function Test:draw()
	for _, button in ipairs(Buttons) do
		button:draw()
	end
	love.graphics.setFont(StateFont)
	love.graphics.print("Test File")
	love.graphics.setFont(DefaultFont)
end

function Test:update(dt)
	for _, button in ipairs(Buttons) do
		button:update(dt)
	end
end

return Test
