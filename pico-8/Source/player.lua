-->8
player = {x=0,y=0}

function player:new (x,y,o)
		self.x = x
		self.y = y
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function player:movement ()
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