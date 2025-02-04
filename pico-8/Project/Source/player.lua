Player = {
  x = 0,
  y = 0,
  fdirX = 0,
  fdirY = 0,
  width = 0,
  height = 0,
  offsetX = 0,
  offsetY = 0,
  currentSprite = 1
}
Player.__index = Player

function Player:new (x , y, width, height, offsetX, offsetY)
  local instance = setmetatable({}, self)
  instance.x = x
  instance.y = y
  instance.width = width
  instance.height = height
  instance.offsetX = offsetX
  instance.offsetY = offsetY
  instance.fdirX = 0
  instance.fdirY = 0
  instance.currentSprite = 1
  return instance
end

function Player:movement ()
  self.fdirX = 0
  self.fdirY = 0
  if btn(➡️) then
    self.fdirX = 1
  end
  if btn(⬅️) then
    self.fdirX = -1
  end
  
  if btn(⬆️) then
    self.fdirY = -1
  end
  if btn(⬇️) then
    self.fdirY = 1
  end

  self.x += self.fdirX * 1
  self.y += self.fdirY * 1
end

function Player:render()
  if self.fdirX == 1 then
    self.currentSprite = 1
  end
  if self.fdirX == -1 then
    self.currentSprite = 2
  end
  spr(self.currentSprite, self.x, self.y)
end