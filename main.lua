StateManager = require("state")

function love.load()
	StateManager:addState("game")
	StateManager:addState("test")
	StateManager:addState("animal.dog")
	StateManager:setState("game")
	StateManager:load()
end

function love.keypressed(key, scancode, isrepeat)
	StateManager:call("keypressed", key, scancode, isrepeat)
end

function love.update(dt)
	StateManager:call("update", dt)
end

function love.draw()
	StateManager:call("draw")
end
