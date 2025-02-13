local tilePlayerSpawnX = 0
local tilePlayerSpawnY = 63
local numTiles = 4
local isReset = false
function _init()
	p = Player:new(0, 63, 7, 7, 0, 0)
	tiles = {
		Tile:new(70, 63, 7, 7), 
		Tile:new(78, 63, 7, 7),
		Tile:new(86, 63, 7, 7),
		Tile:new(86, 71, 7, 7)
	}
end

function _update()
	p:movement()
	CheckTilesCollision()
end

function _draw()
	cls()
	RenderTiles()
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
			tiles[i].spriteIndex = 70
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