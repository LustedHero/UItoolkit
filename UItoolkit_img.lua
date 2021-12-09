UItoolkit_img = {}
UItoolkit_img.__index = UItoolkit_img

function UItoolkit_img:new (img, x, y)
  local UItoolkit_img = {img = love.graphics.newImage (img), x = x, y = y}
  setmetatable (UItoolkit_img, self)
  table.insert (UItoolkit.img_handler, UItoolkit_img)
  return UItoolkit_img
end

function UItoolkit_img:draw ()
  love.graphics.setColor (UItoolkit_theme.BACKGROUND_COLOR)
  love.graphics.setColor (1, 1, 1, 1)
  love.graphics.draw (self.img, self.x, self.y)
end

function UItoolkit_img:setX (x) self.x = x end

function UItoolkit_img:setY (y) self.y = y end

function UItoolkit_img:getX () return self.x end

function UItoolkit_img:getY () return self.y end

function UItoolkit_img:getWidth () return self.img:getWidth () + UItoolkit_theme.GAP * 2 end

function UItoolkit_img:getHeight () return self.img:getHeight () + UItoolkit_theme.GAP * 2 end
