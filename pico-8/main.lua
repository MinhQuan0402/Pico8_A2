function _init()
	p = player:new(63,63)
end

function _update()
 p:movement()
end

function _draw()
	cls()
	spr(1, p.x, p.y)
end