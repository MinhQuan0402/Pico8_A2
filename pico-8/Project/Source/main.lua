function _init()
	p = Player:new(63, 63, 7, 6, 1, 0)
	tile1 = Tile:new(0, 0, 7, 7)
end

function _update()
	p:movement()
end

function _draw()
	cls()
	p:render()
	tile1:render()
end