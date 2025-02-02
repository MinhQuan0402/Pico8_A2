Player = {
  x = 0,
  y = 0,
  fdirX = 1,
  fdirY = 0,
  width = 0,
  height = 0,
  offsetX = 0,
  offsetY = 0
}
Player._index = Player

function Player:new (x , y, width, height, offsetX, offsetY)
  local instance = setmetatable({}, self)
  instance.x = x
  instance.y = y
  instance.width = width
  instance.height = height
  instance.offsetX = offsetX
  instance.offsetY = offsetY
  instance.fdirX = 1
  instance.fdirY = 0
  return instance
end

function Player:movement ()
  if btn(➡️) then
  	self.x = self.x + 1
  end
  if btn(⬅️) then
  	self.x = self.x - 1
  end
  
  if btn(⬆️) then
  	self.y = self.y - 1
  end
  if btn(⬇️) then
  	self.y = self.y + 1
  end
end

function Player:_draw()
  spr(1, self.x, self.y)
end