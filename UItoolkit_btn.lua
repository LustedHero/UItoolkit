UItoolkit_btn = {}
UItoolkit_btn.__index = UItoolkit_btn

function UItoolkit_btn:new (string, x, y, action)
  local UItoolkit_btn = {string = string, x = x, y = y, action = action}
  setmetatable (UItoolkit_btn, self)
  table.insert (UItoolkit.btn_handler, UItoolkit_btn)
  return UItoolkit_btn
end

function UItoolkit_btn:clicked ()
  if UItoolkit.msx >= self.x and UItoolkit.msx <= self.x + UItoolkit_theme.FONT:getWidth (self.string) then
    if UItoolkit.msy >= self.y and UItoolkit.msy <= self.y + UItoolkit_theme.FONT:getHeight () then
      self.action ()
      return true
    end
  end
end

function UItoolkit_btn:draw ()
  love.graphics.setColor (UItoolkit_theme.BACKGROUND_COLOR)
  love.graphics.rectangle ("fill", self.x - UItoolkit_theme.BTN_GAP, self.y - UItoolkit_theme.BTN_GAP, UItoolkit_theme.FONT:getWidth (self.string) + UItoolkit_theme.BTN_GAP * 2, UItoolkit_theme.FONT:getHeight () + UItoolkit_theme.BTN_GAP * 2, UItoolkit_theme.BTN_SEGMENTS)
  love.graphics.setFont (UItoolkit_theme.FONT)
  love.graphics.setColor (UItoolkit_theme.PRIMARY_COLOR)
  love.graphics.print (self.string, self.x, self.y)
  if UItoolkit.msx >= self.x and UItoolkit.msx <= self.x + UItoolkit_theme.FONT:getWidth (self.string) then
    if UItoolkit.msy >= self.y and UItoolkit.msy <= self.y + UItoolkit_theme.FONT:getHeight () then
      love.graphics.setColor (UItoolkit_theme.SECONDARY_COLOR)
      love.graphics.rectangle ("fill", self.x - UItoolkit_theme.BTN_GAP, self.y - UItoolkit_theme.BTN_GAP, UItoolkit_theme.FONT:getWidth (self.string) + UItoolkit_theme.BTN_GAP * 2, UItoolkit_theme.FONT:getHeight () + UItoolkit_theme.BTN_GAP * 2, UItoolkit_theme.BTN_SEGMENTS)
    end
  end
end

function UItoolkit_btn:setX (x) self.x = x end

function UItoolkit_btn:setY (y) self.y = y end

function UItoolkit_btn:getX () return self.x end

function UItoolkit_btn:getY () return self.y end

function UItoolkit_btn:getWidth () return UItoolkit_theme.FONT:getWidth (self.string) + UItoolkit_theme.BTN_GAP * 2 end

function UItoolkit_btn:getHeight () return UItoolkit_theme.FONT:getHeight () + UItoolkit_theme.BTN_GAP * 2 end
