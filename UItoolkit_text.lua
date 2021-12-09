UItoolkit_text = {}
UItoolkit_text.__index = UItoolkit_text

function UItoolkit_text:new (string, x, y, width, lines)
  if width == nil then width = 35 end
  if lines == nil then lines = 5 end
  local UItoolkit_text = {animation = 1, string = self:wrap(string, width), x = x, y = y, width = width, lines = lines, page = 1}
  setmetatable (UItoolkit_text, self)
  table.insert (UItoolkit.text_handler, UItoolkit_text)
  return UItoolkit_text
end

function UItoolkit_text:draw ()
  love.graphics.setColor (UItoolkit_theme.BACKGROUND_COLOR)
  love.graphics.rectangle ("fill", self.x - UItoolkit_theme.TEXT_GAP, self.y - UItoolkit_theme.TEXT_GAP, UItoolkit_theme.FONT:getWidth (self.string[1]) + UItoolkit_theme.TEXT_GAP * 2, (self.lines + 1) * UItoolkit_theme.FONT:getHeight () + UItoolkit_theme.TEXT_GAP * 2, UItoolkit_theme.TEXT_SEGMENTS)
  love.graphics.setFont (UItoolkit_theme.FONT)
  love.graphics.setColor (UItoolkit_theme.PRIMARY_COLOR)
  for i = self.page, self.page + self.lines - 1 do
    if self.string[3][i] ~= nil then love.graphics.print (self.string[3][i], self.x, self.y + UItoolkit_theme.FONT:getHeight () * (i - self.page)) end
  end

  if self.string[3][self.page + self.lines] ~= nil then
    love.graphics.setColor (1, 1, 1, self.animation)
    love.graphics.print (">>>", self.x + self:getWidth () - UItoolkit_theme.FONT:getWidth (">>>") - UItoolkit_theme.TEXT_GAP * 2, self.y + (self.lines) * UItoolkit_theme.FONT:getHeight ())
  end

  if self.string[3][self.page - 1] ~= nil then
    love.graphics.setColor (1, 1, 1, self.animation)
    love.graphics.print ("<<<", self.x, self.y + (self.lines) * UItoolkit_theme.FONT:getHeight ())
  end

  if self.animation < 1 then self.animation = self.animation + 0.005 end
  if self.animation >= 1 then self.animation = 0 end
end

function UItoolkit_text:clicked ()
  --[[if UItoolkit.msx >= self.x and UItoolkit.msx <= self.x + UItoolkit_theme.FONT:getWidth (self.string[1]) then
    if self.string[3][self.page + self.lines] ~= nil and UItoolkit.msy >= self.y + UItoolkit_theme.FONT:getHeight () * self.lines / 2 and UItoolkit.msy <= self.y + UItoolkit_theme.FONT:getHeight () * self.lines then
      self.page = self.page + 1
    end
    if self.string[3][self.page - 1] ~= nil and UItoolkit.msy >= self.y and UItoolkit.msy <= self.y + UItoolkit_theme.FONT:getHeight () * self.lines / 2 then
      self.page = self.page - 1
    end
  end]]--

  if UItoolkit.msy >= self.y and UItoolkit.msy <= self.y + self:getHeight () then
    if self.string[3][self.page - 1] ~= nil and UItoolkit.msx >= self.x and UItoolkit.msx <= self.x + UItoolkit_theme.FONT:getWidth (self.string[1]) / 2 then
      self.page = self.page - 1
    end
    if self.string[3][self.page + self.lines] ~= nil and UItoolkit.msx >= self.x + UItoolkit_theme.FONT:getWidth (self.string[1]) / 2  and UItoolkit.msx <= self.x + UItoolkit_theme.FONT:getWidth (self.string[1]) then
      self.page = self.page + 1
    end
  end
end

function UItoolkit_text:wrap (text, width)
  local tail, lines = text.." ", {}
  while tail do
    lines[#lines + 1], tail = tail
      :gsub ("^%s+", "")
      :gsub (".[\128-\191]*", "\0%0\0", width)
      :gsub ("%z%z", "")
      :gsub ("(%S)%z(%s)", "%1%2\0")
      :gsub ("^(%z[^\r\n%z]*)%f[%s](%Z*)%z(.*)$", "%1\0%2%3")
      :match"^%z(%Z+)%z(.*)$"
    end
  return { table.concat (lines, "\n"), #lines, lines }
end

function UItoolkit_text:setX (x) self.x = x end

function UItoolkit_text:setY (y) self.y = y end

function UItoolkit_text:getX () return self.x end

function UItoolkit_text:getY () return self.y end

function UItoolkit_text:getWidth () return UItoolkit_theme.FONT:getWidth (self.string[1]) + UItoolkit_theme.TEXT_GAP * 2 end

function UItoolkit_text:getHeight () return (self.lines + 1) * UItoolkit_theme.FONT:getHeight () + UItoolkit_theme.TEXT_GAP * 2 end
