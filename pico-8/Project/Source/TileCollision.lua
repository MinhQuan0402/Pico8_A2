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
   spr(65, self.posX, self.posY)
end