local tilePlayerSpawnX = 2
local tilePlayerSpawnY = 20
local numTiles = 57
local isReset = false
local tileWidth = 6
local tileHeight = 6
function _init()
	p = Player:new(2, 20, 5, 5, 0, 0)
	tiles = {
		Tile:new(38, 9, tileWidth, tileHeight),
		Tile:new(44, 9, tileWidth, tileHeight),
		Tile:new(50, 9, tileWidth, tileHeight),

		Tile:new(26, 16, tileWidth, tileHeight),
		Tile:new(32, 16, tileWidth, tileHeight), 
		Tile:new(38, 16, tileWidth, tileHeight),
		Tile:new(50, 16, tileWidth, tileHeight),
		Tile:new(56, 16, tileWidth, tileHeight),
		Tile:new(62, 16, tileWidth, tileHeight), 

		Tile:new(14, 23, tileWidth, tileHeight),
		Tile:new(20, 23, tileWidth, tileHeight),
		Tile:new(26, 23, tileWidth, tileHeight),
		Tile:new(32, 23, tileWidth, tileHeight), 
		Tile:new(38, 23, tileWidth, tileHeight),
		Tile:new(56, 23, tileWidth, tileHeight),
		Tile:new(62, 23, tileWidth, tileHeight),

		Tile:new(14, 30, tileWidth, tileHeight), 
		Tile:new(20, 30, tileWidth, tileHeight),
		Tile:new(26, 30, tileWidth, tileHeight),
		Tile:new(32, 30, tileWidth, tileHeight),
		Tile:new(56, 30, tileWidth, tileHeight), 
		Tile:new(68, 30, tileWidth, tileHeight),

		Tile:new(8,  37, tileWidth, tileHeight),
		Tile:new(14, 37, tileWidth, tileHeight),
		Tile:new(32, 37, tileWidth, tileHeight),
		Tile:new(38, 37, tileWidth, tileHeight),
		Tile:new(44, 37, tileWidth, tileHeight), 
		Tile:new(56, 37, tileWidth, tileHeight),
		Tile:new(62, 37, tileWidth, tileHeight),
		Tile:new(68, 37, tileWidth, tileHeight),

		Tile:new(8,  44, tileWidth, tileHeight),
		Tile:new(14, 44, tileWidth, tileHeight),
		Tile:new(20, 44, tileWidth, tileHeight), 
		Tile:new(26, 44, tileWidth, tileHeight),
		Tile:new(32, 44, tileWidth, tileHeight),
		Tile:new(44, 44, tileWidth, tileHeight),
		Tile:new(56, 44, tileWidth, tileHeight),
		Tile:new(62, 44, tileWidth, tileHeight),
		Tile:new(68, 44, tileWidth, tileHeight),
		
		Tile:new(8,  51, tileWidth, tileHeight), 
		Tile:new(20, 51, tileWidth, tileHeight),
		Tile:new(26, 51, tileWidth, tileHeight),
		Tile:new(32, 51, tileWidth, tileHeight),
		Tile:new(44, 51, tileWidth, tileHeight), 
		Tile:new(50, 51, tileWidth, tileHeight),
		Tile:new(56, 51, tileWidth, tileHeight),
		Tile:new(62, 51, tileWidth, tileHeight),
		Tile:new(68, 51, tileWidth, tileHeight), 
		
		Tile:new(32, 58, tileWidth, tileHeight),
		Tile:new(38, 58, tileWidth, tileHeight),
		Tile:new(62, 58, tileWidth, tileHeight),
		
		Tile:new(38, 65, tileWidth, tileHeight), 
		Tile:new(44, 65, tileWidth, tileHeight),
		Tile:new(50, 65, tileWidth, tileHeight),
		Tile:new(56, 65, tileWidth, tileHeight),
		Tile:new(62, 65, tileWidth, tileHeight),

		Tile:new(38, 72, tileWidth, tileHeight),
		Tile:new(44, 72, tileWidth, tileHeight)
	}
	objs = {}
	make_obj(15,15,6,6,0,false,1,0,0)
  	make_obj(10,10,6,6,0,true,2,0,0)
end

function _update()
	p:movement()
	update_objs()
	camera(p.x - 63, p.y - 63)
	CheckTilesCollision()
	check_obj_collision()
end

function _draw()
	cls(3)
	palt(14, true)
	RenderTiles()
	render_objs()
	p:render()
end

function CheckTilesCollision()
	for i=1, numTiles do
		tiles[i]:CheckForCollision()

		if(tiles[i].numTouch >= 2) then
			isReset = true
			break
		end
	end

	if(isReset == true) then
		p.x = tilePlayerSpawnX
		p.y = tilePlayerSpawnY
		for i=1, numTiles do
			tiles[i].spriteIndex = 63
			tiles[i].numTouch = 0
		end
		isReset = false
	end
end

function RenderTiles()
	for i=1, numTiles do
		tiles[i]:render()
	end
end

function make_obj (x, y, width, height, spriteid, interactive, id, offsetX, offsetY) --dylan
	local obj = {}
	  obj.x = x
	  obj.y = y
	  obj.width = width
	  obj.height = height
	  obj.spriteid = spriteid --use this as obj type
	  obj.interactive = interactive
	  obj.id = id
	  obj.steppedon = false
	  obj.offsetX = offsetX
	  obj.offsetY = offsetY
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
	  if (((p.x + p.offsetX + p.width*0.5) >= (obj.x + obj.offsetX - obj.width*0.5)) and ((p.x+p.offsetX+p.width*0.5) <= (obj.x+obj.offsetX+obj.width*0.5)) or ((p.x + p.offsetX - p.width * 0.5) >= (obj.x+obj.offsetX-obj.width*0.5)) and ((p.x + p.offsetX - p.width*0.5) <= (obj.x+obj.offsetX+obj.width*0.5))) and (((p.y+p.offsetY+p.height*0.5) >= (obj.y+obj.offsetY-obj.height*0.5)) and ((p.y+p.offsetY+p.height*0.5) <= (obj.y+obj.offsetY+obj.height*0.5)) or ((p.y+p.offsetY-p.height*0.5) >= (obj.y+obj.offsetY-obj.height*0.5)) and ((p.y+p.offsetY-p.height*0.5) <= (obj.y+obj.offsetY+obj.height*0.5))) then
		if obj.interactive == false then
		  if p.fdirX != 0 then
			p.x -= ((p.width * 0.5 + obj.width * 0.5) - abs(p.x - obj.x)) * p.fdirX
		  end
		  if p.fdirY != 0 then
			p.y -= ((p.height * 0.5 + obj.height * 0.5) - abs(p.y - obj.y)) * p.fdirY
		  end
		end
		if obj.interactive == true then
		  if p.fdirX != 0 then
			obj.x += ((p.width * 0.5 + obj.width * 0.5) - abs(p.x - obj.x)) * p.fdirX
		  end
		  if p.fdirY != 0 then
			obj.y += ((p.height * 0.5 + obj.height * 0.5) - abs(p.y - obj.y)) * p.fdirY
		  end
		  for obj2 in all (objs) do
			if obj2.id != obj.id then
			  if (((obj2.x+obj2.offsetX+obj2.width*0.5) >= (obj.x+obj.offsetX-obj.width*0.5)) and ((obj2.x+obj2.offsetX+obj2.width*0.5) <= (obj.x+obj.offsetX+obj.width*0.5)) or ((obj2.x+obj2.offsetX-obj2.width*0.5) >= (obj.x+obj.offsetX-obj.width*0.5)) and ((obj2.x+obj2.offsetX-obj2.width*0.5) <= (obj.x+obj.offsetX+obj.width*0.5))) and (((obj2.y+obj2.offsetY+obj2.height*0.5) >= (obj.y+obj.offsetY-obj.height*0.5)) and ((obj2.y+obj2.offsetY+obj2.height*0.5) <= (obj.y+obj.offsetY+obj.height*0.5)) or ((obj2.y+obj2.offsetY-obj2.height*0.5) >= (obj.y+obj.offsetY-obj.height*0.5)) and ((obj2.y+obj2.offsetY-obj2.height*0.5) <= (obj.y+obj.offsetY+obj.height*0.5))) then
				if p.fdirX != 0 then
				  local distancex = ((obj.width * 0.5 + obj2.width * 0.5) - abs(obj2.x - obj.x)) * p.fdirX
				  obj.x -= distancex
				  p.x -= distancex
				end
				if p.fdirY != 0 then
				  local distancey = ((obj.height * 0.5 + obj2.height * 0.5) - abs(obj2.y - obj.y)) * p.fdirY
				  obj.y -= distancey
				  p.y -= distancey
				end
			  end
			end
		  end 
		end
	  end
	end
  end