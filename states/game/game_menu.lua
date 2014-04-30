local Menu = Game:addState('Menu')

intromusic = love.audio.newSource("/sounds/intromusic.ogg", "stream")
intromusic:play()
intromusic:setVolume(0.5)
intromusic:setLooping("true")

local friendsound = love.audio.newSource("/sounds/friend.ogg", "static")
friendsound:setVolume(0.1)

bgm = love.audio.newSource("/sounds/music1.ogg", "stream")


function Menu:enteredState(previous_level_name)
  self.menu_font = g.newFont("fonts/04b03.TTF", 48)
  g.setFont(self.menu_font)

  self.all_levels = {}
  for index, name in pairs(self.sorted_names) do
    local level = g.newCanvas()
    g.setCanvas(level)
    g.setColor(COLORS.white:rgb())
    local bg = self.preloaded_images["bg.png"]
    g.draw(bg, 0, 0, 0, g.getWidth() / bg:getWidth(), g.getHeight() / bg:getHeight())
    g.setColor(COLORS.white:rgb())
    local level_data = MapLoader.load(name)
    local tile_layers = level_data.tile_layers
    g.draw(tile_layers["Background"].sprite_batch, 0, 0, 0, level_data.scale, level_data.scale)
    g.draw(tile_layers["Foreground"].sprite_batch, 0, 0, 0, level_data.scale, level_data.scale)
    g.setCanvas()
    self.all_levels[name] = level

    if previous_level_name == name then
      self.selected_level_index = index
    end
  end

  self.selected_level_index = self.selected_level_index or 1
end

function Menu:draw()
  g.setColor(COLORS.white:rgb())
  g.draw(self.all_levels[self.sorted_names[self.selected_level_index]], 0, 0)

  local dy = love.graphics.getFont():getHeight() + 3
  for index,name in ipairs(self.sorted_names) do
    local x, y = 5, index * dy
    g.setColor(COLORS.black:rgb())
    g.printf(name, 0, y, g.getWidth(), "center")

    if index == self.selected_level_index then
      g.setColor(COLORS.yellow:rgb())
      local old_width = g.getLineWidth()
      g.setLineWidth(2)
      local width = self.menu_font:getWidth(name)
      g.rectangle("line", g.getWidth() / 2 - width / 2 - 2, y - 2, width + 4, dy)
      g.setLineWidth(old_width)
    end
  end
end

function Menu:keypressed(key, unicode)
  if key == "return" then
    self:gotoState("Main", self.sorted_names[self.selected_level_index])

    -- Stop intro music, play in-game music
    intromusic:stop()
    bgm:rewind()
    friendsound:play()
    bgm:play()
    bgm:setVolume(0.4)
    bgm:setLooping("true")

    return
  elseif key == "down" then
    self.selected_level_index = self.selected_level_index + 1
  elseif key == "up" then
    self.selected_level_index = self.selected_level_index - 1
  elseif key == "escape" then
    self:gotoState("Title")
    return
  end
  self.selected_level_index = math.clamp(1, self.selected_level_index, #self.sorted_names)
end

function Menu:gamepadpressed(joystick, button)
  if button == "dpup" then
    love.event.push("keypressed", "up")
  elseif button == "dpdown" then
    love.event.push("keypressed", "down")
  elseif button == "a" then
    love.event.push("keypressed", "return")
  elseif button == "b" or button == "back" then
    love.event.push("keypressed", "escape")
  end
end

function Menu:exitedState()
  self.selected_level_index = nil
  self.all_levels = nil
end

return Menu
