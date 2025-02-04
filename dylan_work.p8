pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
player = {
  x = 30,
  y = 30,
  fdirx = 0,
  fdiry = 0,
  width = 0,
  height = 0,
  offsetx = 1,
  offsety = 0
}
player._index = player

function player:new (x , y, width, height, offsetx, offsety)
  local instance = setmetatable({}, self)
  instance.x = x
  instance.y = y
  instance.width = width
  instance.height = height
  instance.offsetx = offsetx
  instance.offsety = offsety
  instance.fdirx = 0
  instance.fdiry = 0
  return instance
end

function player:reset_dir ()
  self.fdirx = 0
  self.fdiry = 0
end

function player:movement ()
  if btn(➡️) then
  	self.fdirx = 1
  end
  if btn(⬅️) then
  	self.fdirx = -1
  end
  
  if btn(⬆️) then
  	self.fdiry = -1
  end
  if btn(⬇️) then
  	self.fdiry = 1
  end
  self.x += self.fdirx * 1
  self.y += self.fdiry * 1
end

function player:_draw()
  spr(1, self.x, self.y)
end

function _init()
	 p = player:new(63, 63, 7, 6, 1, 0)
  objs = {}
  make_obj(40,40,6,6,0,false,1,0,0)
end

function _update()
  --print_player_attributes()
  player:reset_dir()
  update_objs()
  player:movement()
  check_obj_collision()
end

function _draw()
  cls()
  render_objs()
  player:_draw()
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
    if (((player.x+player.offsetx+player.width*0.5) >= (obj.x+obj.offsetx-obj.width*0.5)) and ((player.x+player.offsetx+player.width*0.5) <= (obj.x+obj.offsetx+obj.width*0.5))) or (((player.x+player.offsetx-player.width*0.5) >= (obj.x+obj.offsetx-obj.width*0.5)) and ((player.x+player.offsetx-player.width*0.5) <= (obj.x+obj.offsetx+obj.width*0.5))) and (((player.y+player.offsety+player.height*0.5) >= (obj.y+obj.offsety-obj.height*0.5)) and ((player.y+player.offsety+player.height*0.5) <= (obj.y+obj.offsety+obj.height*0.5))) or (((player.y+player.offsety-player.height*0.5) >= (obj.y+obj.offsety-obj.height*0.5)) and ((player.y+player.offsety-player.height*0.5) <= (obj.y+obj.offsety+obj.height*0.5))) then
      player.x += (player.x+player.offsetx+player.width*0.5-obj.x+obj.offsetx-obj.width*0.5) * -player.fdirx
      player.y += player.y+player.offsety+player.height*0.5-obj.y+obj.offsety-obj.height*0.5 * -player.fdiry
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
