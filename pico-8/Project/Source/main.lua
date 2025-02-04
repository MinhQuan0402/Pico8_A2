function _init()
	p = Player:new(63, 63, 7, 6, 1, 0)
end

function _update()
	p:movement()
	print(p.fdirX)
	print(p.fdirY)
end

function _draw()
	cls()
	p:render()
end