local store = {}

function store:load()
	self.active = false
end

function store:draw()
	love.graphics.setColor(0, 200, 50, 255)
	love.graphics.rectangle('fill', 660, 400, 75, 100)
	love.graphics.setColor(255, 255, 255, 255)

	if self.active then
		love.graphics.setColor(255, 50, 255, 255)
		local x = (love.graphics.getWidth() / 2) - 200
		love.graphics.rectangle('fill', x, 100, 400, 300)
		love.graphics.setColor(255, 255, 255, 255)
	end
end

return store
