function _init()
	p = Player:new(78, 63, 7, 7, 0, 0)
	tile1 = Tile:new(70, 63, 7, 7)
end

function _update()
	p:movement()
	tile1:CheckForCollision()
end

function _draw()
	cls()
	tile1:render()
	p:render()
end