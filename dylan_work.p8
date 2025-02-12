pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
player = {
  x = 0,
  y = 0,
  fdirx = 0,
  fdiry = 0,
  width = 0,
  height = 0,
  offsetx = 0,
  offsety = 0,
  isfacingright = true
}
player.__index = player

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
  instance.isfacingright = true
  return instance
end

function player:movement ()
  self.fdirx = 0
  self.fdiry = 0
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

  if self.fdirx == 1 then
    self.isfacingright = true
  end
  if self.fdirx == -1 then
    self.isfacingright = false
  end

  self.x += self.fdirx * 1
  self.y += self.fdiry * 1
end

function player:render()
  spr(1, self.x, self.y, 1, 1, self.isfacingright)
end

function _init()
	 p = player:new(63, 63, 7, 6, 1, 0)
  objs = {}
  make_obj(40,40,6,6,0,false,1,0,0)
  make_obj(20,20,6,6,0,true,2,0,0)
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
  player:render()
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
    --do something
  end
end


function check_obj_collision() --dylan
  for obj in all(objs) do 
    if (((player.x+player.offsetx+player.width*0.5) >= (obj.x+obj.offsetx-obj.width*0.5)) and ((player.x+player.offsetx+player.width*0.5) <= (obj.x+obj.offsetx+obj.width*0.5)) or ((player.x+player.offsetx-player.width*0.5) >= (obj.x+obj.offsetx-obj.width*0.5)) and ((player.x+player.offsetx-player.width*0.5) <= (obj.x+obj.offsetx+obj.width*0.5))) and (((player.y+player.offsety+player.height*0.5) >= (obj.y+obj.offsety-obj.height*0.5)) and ((player.y+player.offsety+player.height*0.5) <= (obj.y+obj.offsety+obj.height*0.5)) or ((player.y+player.offsety-player.height*0.5) >= (obj.y+obj.offsety-obj.height*0.5)) and ((player.y+player.offsety-player.height*0.5) <= (obj.y+obj.offsety+obj.height*0.5))) then
      if obj.interactive == false then
        if player.fdirx != 0 then
          player.x -= ((player.width * 0.5 + obj.width * 0.5) - abs(player.x - obj.x)) * player.fdirx
        end
        if player.fdiry != 0 then
          player.y -= ((player.height * 0.5 + obj.height * 0.5) - abs(player.y - obj.y)) * player.fdiry
        end
      end
      if obj.interactive == true then
        if player.fdirx != 0 then
          obj.x += ((player.width * 0.5 + obj.width * 0.5) - abs(player.x - obj.x)) * player.fdirx
        end
        if player.fdiry != 0 then
          obj.y += ((player.height * 0.5 + obj.height * 0.5) - abs(player.y - obj.y)) * player.fdiry
        end
        for obj2 in all (objs) do
          if obj2.id != obj.id then
            if (((obj2.x+obj2.offsetx+obj2.width*0.5) >= (obj.x+obj.offsetx-obj.width*0.5)) and ((obj2.x+obj2.offsetx+obj2.width*0.5) <= (obj.x+obj.offsetx+obj.width*0.5)) or ((obj2.x+obj2.offsetx-obj2.width*0.5) >= (obj.x+obj.offsetx-obj.width*0.5)) and ((obj2.x+obj2.offsetx-obj2.width*0.5) <= (obj.x+obj.offsetx+obj.width*0.5))) and (((obj2.y+obj2.offsety+obj2.height*0.5) >= (obj.y+obj.offsety-obj.height*0.5)) and ((obj2.y+obj2.offsety+obj2.height*0.5) <= (obj.y+obj.offsety+obj.height*0.5)) or ((obj2.y+obj2.offsety-obj2.height*0.5) >= (obj.y+obj.offsety-obj.height*0.5)) and ((obj2.y+obj2.offsety-obj2.height*0.5) <= (obj.y+obj.offsety+obj.height*0.5))) then
              if player.fdirx != 0 then
                local distancex = ((obj.width * 0.5 + obj2.width * 0.5) - abs(obj2.x - obj.x)) * player.fdirx
                obj.x -= distancex
                player.x -= distancex
              end
              if player.fdiry != 0 then
                local distancey = ((obj.height * 0.5 + obj2.height * 0.5) - abs(obj2.y - obj.y)) * player.fdiry
                obj.y -= distancey
                player.y -= distancey
              end
            end
          end
        end 
      end
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
