local grid = require 'grid'

local player = {}

function player:load()
	self.pos = #grid.tiles
	self.pocketmoney = 0
	self.dead = false
	self.item = 'rake'
end

function player:update(dt)
	--
end

function player:keypressed(key)
	if key == 'up' then
		if self.pos > grid.width then
			self.pos = self.pos - grid.width
		end
	elseif key == 'down' then
		if self.pos <= #grid.tiles - grid.width then
			self.pos = self.pos + grid.width
		end
	elseif key == 'left' then
		if self.pos % grid.width ~= 1 then
			self.pos = self.pos - 1
		end
	elseif key == 'right' then
		if self.pos % grid.width ~= 0 then
			self.pos = self.pos + 1
		end
	end
end

function player:stepson(tile)
	if tile.isDeadly then
		self.dead = true
	end

	if tile.revealed then return end

	if self.item == 'rake' then
		self.action = 'Raking...'
		tile.revealed = true

		if tile.item then
			self:addmoney(tile.item.value)
		end
	end
end

function player:addmoney(itemvalue)
	self.pocketmoney = self.pocketmoney + itemvalue
end

function player:draw(coords)
	-- love.graphics.circle('fill', coords.x, coords.y, 25)
	love.graphics.draw(assets.images.player, coords.x, coords.y)
end

return player
