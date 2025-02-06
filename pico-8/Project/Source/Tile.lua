Tile = {
    posX = 0,
    posY = 0,
    width = 0,
    height = 0,
}
Tile.__index = Tile

function Tile:new(x, y, width, height)
    local instance = setmetatable({}, Tile)
    instance.posX = x
    instance.posY = y
    instance.width = width or 1
    instance.height = height or 1
    return instance
end

function Tile:render()
   spr(65, self.posX, self.posY, self.width, self.height)
end

function Tile:CheckForCollision()
     playerHalfWidth = p.width / 2
     playerHalfHeight = p.height / 2

     tileHalfWidth = self.width / 2
     tileHalfHeight = self.height / 2

    if((p.x + p.offsetX + playerHalfWidth >= self.posX - tileHalfWidth) and (p.x + p.offsetX - playerHalfWidth <= self.posX + tileHalfWidth) and
       (p.y + p.offsetY + playerHalfHeight >= self.posY - tileHalfHeight) and (p.y + p.offsetY - playerHalfHeight <= self.posY + tileHalfHeight)) then
        --p.x = self.posX - tileHalfWidth - playerHalfWidth
        print("Collided")
    end
end