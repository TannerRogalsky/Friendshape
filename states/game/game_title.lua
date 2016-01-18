local Title = Game:addState('Title')

function Title:enteredState()
  if self.title_image == nil then
    self.title_image = self.preloaded_images["friendshape_controls.png"]
    self.title_image:setFilter("nearest", "nearest")
  end

  self.intro_music = self.preloaded_audio['intromusic.ogg']
  self.intro_music:setVolume(0.5)
  self.intro_music:setLooping(true)
  self.intro_music:play()
end

function Title:draw()
  g.setColor(COLORS.white:rgb())
  local bg = self.title_image
  g.draw(bg, 0, 0, 0, g.getWidth() / bg:getWidth(), g.getHeight() / bg:getHeight())
end

function Title:keypressed(key, unicode)
  if key == "escape" then
    love.event.quit()
  else
    self:gotoState("Menu")
  end
end

function Title:gamepadpressed(joystick, button)
  if button == "back" or button == "b" then
      love.event.quit()
  else
    self:gotoState("Menu")
  end
end

function Title:exitedState()
end

return Title
