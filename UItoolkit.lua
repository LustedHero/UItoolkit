require "UItoolkit_theme"
require "UItoolkit_btn"
require "UItoolkit_text"
require "UItoolkit_pack"
require "UItoolkit_img"

UItoolkit = {}
UItoolkit.btn_handler = {}
UItoolkit.text_handler = {}
UItoolkit.img_handler = {}
UItoolkit.msx , UItoolkit.msy = 0, 0

function UItoolkit:clear ()
  UItoolkit.btn_handler = {} UItoolkit.text_handler = {} UItoolkit.img_handler = {}
end

function UItoolkit:draw ()
  for k, v in ipairs (UItoolkit.btn_handler) do UItoolkit.btn_handler[k]:draw () end
  love.graphics.setColor (1, 1, 1, 1) -- Clear color
  for k, v in ipairs (UItoolkit.text_handler) do UItoolkit.text_handler[k]:draw () end
  love.graphics.setColor (1, 1, 1, 1) -- Clear color
  for k, v in ipairs (UItoolkit.img_handler) do UItoolkit.img_handler[k]:draw () end
  love.graphics.setColor (1, 1, 1, 1) -- Clear color
end

function love.mousemoved (x, y)
	UItoolkit.msx = x UItoolkit.msy = y
end

function love.mousepressed (x, y, button)
  for k, v in ipairs (UItoolkit.btn_handler) do UItoolkit.btn_handler[k]:clicked () end
  for k, v in ipairs (UItoolkit.text_handler) do UItoolkit.text_handler[k]:clicked () end
end
