pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--untitled

player = {x=0,y=0}

function player:new (x,y,o)
		self.x = x
		self.y = y
		self.width = 6
		self.height = 7
		self.offsetx = 0
		self.offsety = 0
		self.fdirx = 0
		self.fdiry = 0
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function print_player_attributes()
  print(player.x)
  print(player.y)
  print(player.fdirx)
  print(player.fdiry)
  print(player.width)
  print(player.height)
  print(player.offsetx)
  print(player.offsety)
end

function player:movement ()
  if btn(➡️) then
  	self.x = self.x + 1
  	self.fdirx = 1
  end
  if btn(⬅️) then
  	self.x = self.x - 1
  	self.fdirx = -1
  end
  
  if btn(⬆️) then
  	self.y = self.y - 1
  	self.fdiry = -1
  end
  if btn(⬇️) then
  	self.y = self.y + 1
  	self.fdiry = 1
  end
end

function _init()
	 player:new(63, 63)
  objs = {}
  make_obj(40,40,6,6,0,false,1,0,0)
end

function _update()
  --print_player_attributes()
  update_objs()
  player:movement()
  check_obj_collision()
end

function _draw()
  cls()
  render_objs()
  spr(1, player.x, player.y)
end

function make_obj (x, y, width, height, spriteid, interactive, id, offsetx, offsety) --dylan
  local obj = {}
    obj.x = x
    obj.y = y
    obj.width = width
    obj.height = height
    obj.spriteid = spriteid --use this as obj type
    obj.interactive = interactive
    obj.id = id
    obj.steppedon = false
    obj.offsetx = offsetx
    obj.offsety = offsety
  add(objs, obj)
end

function render_objs () --dylan
  for obj in all(objs) do
    spr(obj.spriteid, obj.x, obj.y)
    
  end
end

function update_objs () --dylan
  for obj in all(objs) do
    print(obj.x)
    print(obj.y)
    print(obj.width)
    print(obj.height)
    print(obj.offsetx)
    print(obj.offsety)
  end
end

function check_obj_collision() --dylan
  for obj in all(objs) do
    --if player is colliding to left or right of obj then
    if ((player.x+player.offsetx+player.width*0.5) >= (obj.x+obj.offsetx-obj.width*0.5)) & ((player.x+player.offsetx+player.width*0.5) <= (obj.x+obj.offsetx+obj.width*0.5)) then
      player.x += (player.x+player.offsetx+player.width*0.5-obj.x+obj.offsetx-obj.width*0.5) * -player.fdirx
    end
    if ((player.x+player.offsetx-player.width*0.5) >= (obj.x+obj.offsetx-obj.width*0.5)) & ((player.x+player.offsetx-player.width*0.5) <= (obj.x+obj.offsetx+obj.width*0.5)) then 
      player.x += (player.x+player.offsetx-player.width*0.5-obj.x+obj.offsetx+obj.width*0.5) * -player.fdirx
    end
    --if player is colliding to bottom of obj then
    if ((player.y+player.offsety+player.height*0.5) >= (obj.y+obj.offsety-obj.height*0.5)) & ((player.y+player.offsety+player.height*0.5) <= (obj.y+obj.offsety+obj.height*0.5)) then
      player.y -= player.y+player.offsety+player.height*0.5-obj.y+obj.offsety-obj.height*0.5 * -player.fdiry
    end
    if ((player.y+player.offsety-player.height*0.5) >= (obj.y+obj.offsety-obj.height*0.5)) & ((player.y+player.offsety-player.height*0.5) <= (obj.y+obj.offsety+obj.height*0.5)) then 
      player.y -= player.y+player.offsety-player.height*0.5-obj.y+obj.offsety+obj.height*0.5 * -player.fdiry
    end
  end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444440080000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04400040088888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0404004008a88a800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04004040088998800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04000440088888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
04444440008888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000500005000050010500000000000000000000000000000000000000000000000000000000
