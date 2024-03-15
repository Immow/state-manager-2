local Test = {}
local Button = require("button")

local Buttons = {
	Button.new({
		x = 100,
		y = 200,
		text = "Load Test",
		fn = function()
			StateManager:execute("cow", "Mooooooooo")
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
end

function Test:update(dt)
	for _, button in ipairs(Buttons) do
		button:update(dt)
	end
end

return Test
