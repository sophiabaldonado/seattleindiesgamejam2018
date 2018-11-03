local grid = require 'grid'

local player = {}

function player:load()
	self.pos = 1
end

function player:update(dt)

end

function player:keypressed(key)
	self.pos = grid:moveplayer(key)

		if key == 'up' then
			return self.pos = self.pos - grid.width
		if key == 'down' then
			return self.pos = self.pos + grid.width
		if key == 'left' then
			return self.pos = self.pos - 1
		if key == 'right' then
			return self.pos = self.pos + 1
		end


end

function player:draw(coords)
	love.graphics.circle('fill', coords.x, coords.y, 25)
end

return player
