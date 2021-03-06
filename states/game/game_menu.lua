local Menu = Game:addState('Menu')

function Menu:enteredState(previous_level_name)
  self.menu_font = self.preloaded_fonts['04b03_48']
  g.setFont(self.menu_font)

  self.intro_music:play()

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

function Menu:joystickaxis(joystick, axis, value)
  if axis == 2 then
    if math.abs(value) > 0.5 and self.polling == nil then
      poll_joystick()
      self.polling = cron.every(0.3, poll_joystick)
    elseif math.abs(value) <= 0.5 and self.polling then
      cron.cancel(self.polling)
      self.polling = nil
    end
  end
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

function poll_joystick()
  for _,joystick in ipairs(love.joystick:getJoysticks()) do
    local x, y = joystick:getAxes()
    if y > 0.5 then
      love.event.push("keypressed", "down")
    elseif y < -0.5 then
      love.event.push("keypressed", "up")
    end
  end
end

function Menu:exitedState()
  cron.reset()
  self.polling = nil
  self.selected_level_index = nil
  self.all_levels = nil

-- Stop intro music, play in-game music
  self.intro_music:stop()
end

return Menu
