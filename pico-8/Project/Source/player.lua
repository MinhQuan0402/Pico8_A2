Player = {
  x = 0,
  y = 0,
  fdirX = 0,
  fdirY = 0,
  width = 0,
  height = 0,
  offsetX = 0,
  offsetY = 0,
  isFacingLeft = false
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
  instance.isFacingLeft = false
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

  if self.fdirX == 1 then
    self.isFacingLeft = false
  elseif self.fdirX == -1 then
    self.isFacingLeft = true
  end
  self.x += self.fdirX * 1
  self.y += self.fdirY * 1
end

function Player:render()
  spr(72, self.x, self.y, 1, 1, self.isFacingLeft)
end

function Player:setposition(x, y)
  self.posX = x or 1
  self.posY = y or 1
end