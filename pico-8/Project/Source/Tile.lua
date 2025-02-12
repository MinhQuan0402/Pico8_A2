Tile = {
    posX = 0,
    posY = 0,
    width = 1,
    height = 1,
    spriteIndex = 70,
    isTouchingTile = false,
    numTouch = 0
}
Tile.__index = Tile

function Tile:new(x, y, width, height)
    local instance = setmetatable({}, Tile)
    instance.posX = x
    instance.posY = y
    instance.width = width or 1
    instance.height = height or 1
    instance.spriteIndex = 70
    instance.numTouch = 0
    instance.isTouchingTile = false
    return instance
end

function Tile:render()
   spr(self.spriteIndex, self.posX, self.posY, 1, 1)
end

function Tile:CheckForCollision()
     local playerHalfWidth = p.width / 2
     local playerHalfHeight = p.height / 2

     local tileHalfWidth = self.width / 2
     local tileHalfHeight = self.height / 2

    if(self.isTouchingTile == false and ((p.x + p.offsetX + playerHalfWidth >= self.posX - tileHalfWidth) and (p.x + p.offsetX - playerHalfWidth <= self.posX + tileHalfWidth) and
       (p.y + p.offsetY + playerHalfHeight >= self.posY - tileHalfHeight) and (p.y + p.offsetY - playerHalfHeight <= self.posY + tileHalfHeight))) then
       self.isTouchingTile = true
       self.spriteIndex = 71
       self.numTouch += 1
    elseif (self.isTouchingTile == true and not ((p.x + p.offsetX + playerHalfWidth >= self.posX - tileHalfWidth) and (p.x + p.offsetX - playerHalfWidth <= self.posX + tileHalfWidth) and
       (p.y + p.offsetY + playerHalfHeight >= self.posY - tileHalfHeight) and (p.y + p.offsetY - playerHalfHeight <= self.posY + tileHalfHeight))) then
        self.isTouchingTile = false
    end
end