function RGBA(r, g, b, a)
    return 1 / (255 / r), 1 / (255 / g), 1 / (255 / b), 1 / (255 / a)
end

UItoolkit_theme = {}
UItoolkit_theme.FONT = love.graphics.getFont()
UItoolkit_theme.PRIMARY_COLOR = {0, 0, 0, 1}
UItoolkit_theme.SECONDARY_COLOR = {0.1, 0.1, 0.1, 0.1}
UItoolkit_theme.BACKGROUND_COLOR = {RGBA (155, 155, 155, 55)}
UItoolkit_theme.GAP = 6
UItoolkit_theme.BTN_GAP = 6
UItoolkit_theme.BTN_SEGMENTS = 12
UItoolkit_theme.TEXT_GAP = 6
UItoolkit_theme.TEXT_SEGMENTS = 12

--[[ DEFAULT
UItoolkit_theme = {}
UItoolkit_theme.FONT = love.graphics.getFont()
UItoolkit_theme.PRIMARY_COLOR = {1, 1, 1, 1}
UItoolkit_theme.SECONDARY_COLOR = {0.1, 0.1, 0.1, 1}
UItoolkit_theme.BACKGROUND_COLOR = {0.55, 0.3, 0.5, 0.3}
UItoolkit_theme.GAP = 6
UItoolkit_theme.BTN_GAP = 6
UItoolkit_theme.BTN_SEGMENTS = 12
UItoolkit_theme.TEXT_GAP = 6
UItoolkit_theme.TEXT_SEGMENTS = 12
]]--
