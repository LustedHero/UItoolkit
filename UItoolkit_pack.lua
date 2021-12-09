UItoolkit_pack = {}
UItoolkit_pack.__index = UItoolkit_pack

function UItoolkit_pack:new (items)
  local UItoolkit_pack = {items = items}
  setmetatable (UItoolkit_pack, self)
  return UItoolkit_pack
end

function UItoolkit_pack:get (key)
  return self.items[key]
end

function UItoolkit_pack:pack (position, option)
  self.items[1]:setX (position[1])
  self.items[1]:setY (position[2])
  if position[1] == "CENTER" then
    self.items[1]:setX (math.floor (love.graphics.getWidth () / 2 - self:getWidth () / 2))
  end
  if position[2] == "CENTER" then
    self.items[1]:setY (math.floor (love.graphics.getHeight () / 2 - self:getHeight () / 2))
  end
  if option == nil then option = "TOP_TO_BOTTOM" end
  if option == "TOP_TO_BOTTOM" then
    for i = 2, #self.items do
      self.items[i]:setY (self.items[i - 1]:getY () + self.items[i - 1]:getHeight () + UItoolkit_theme.GAP)
      self.items[i]:setX (self.items[i - 1]:getX ())
    end
  end

  if option == "LEFT_TO_RIGHT" then
    for i = 2, #self.items do
      self.items[i]:setY (self.items[i - 1]:getY ())
      self.items[i]:setX (self.items[i - 1]:getX () + self.items[i - 1]:getWidth () + UItoolkit_theme.GAP)
    end
  end
end

function UItoolkit_pack:getHeight ()
  local h = 0
  for i, v in ipairs(self.items) do
    h = h + v:getHeight ()
  end
  return h
end

function UItoolkit_pack:getWidth ()
  return self.items[1]:getWidth ()
end

function UItoolkit_pack:setX (x) return self.items[1]:setX (x) end

function UItoolkit_pack:setY (y) return self.items[1]:setY (y) end

function UItoolkit_pack:getX () return self.items[1]:getX () end

function UItoolkit_pack:getY () return self.items[1]:getY () end
