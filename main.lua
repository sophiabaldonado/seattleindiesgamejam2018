local player = require 'player'
local grid = require 'grid'

function love.load()
	grid:load()
	player:load()
	convert = {
		[1] = (grid.tileSize / 2) * 1,
		[2] = (grid.tileSize / 2) * 3,
		[0] = (grid.tileSize / 2) * 5
	}

	paused = false
end

function love.update(dt)
	if not paused then
		grid:update(dt)
		player:update(dt)
	end
	if player.dead then
		paused = true
	end
end

function love.draw()
	grid:draw()
	x = convert[math.fmod(player.pos, grid.width)]
	y = convert[findY(player.pos)]
	player:draw({ x = x, y = y })

	if paused then
		local text = 'opps no text :('
		if player.dead then
			text = 'yoer ded!!!'
		end

		love.graphics.rectangle('fill', 100, 100, 300, 300)
		love.graphics.setColor(0, 100, 0, 255)
		love.graphics.print(text, 150, 200)
		love.graphics.setColor(255, 255, 255, 255)

	end
end

function findY(pos)
	if pos <= grid.width then return 1 end
	if pos > #grid.tiles - grid.width then return 0 end
	return 2

end

function love.keypressed(key)
	if not paused then
		player:keypressed(key)
	end
end
