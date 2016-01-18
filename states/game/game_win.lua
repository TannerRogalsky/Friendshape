local Win = Game:addState('Win')

function Win:enteredState()
  self.waiting = true
  cron.after(0.5, function()
    self.waiting = false
  end)

  self.victorysound = self.preloaded_audio['victorysound.ogg']
  self.victorysound:setVolume(0.2)
  self.victorysound:play()
end

function Win:draw()
  g.setColor(COLORS.white:rgb())
  g.draw(self.final_screen, 0, 0)
  g.setColor(0, 0, 0, 255 / 2)
  g.rectangle("fill", 0, 0, g.getWidth(), g.getHeight())
  g.setColor(COLORS.white:rgb())
  local fg = self.preloaded_images["win.png"]
  g.draw(fg, 0, 0, 0, g.getWidth() / fg:getWidth(), g.getHeight() / fg:getHeight())
end

function Win:keypressed(key, unicode)
  if self.waiting then return end
  self:gotoState("Menu", self.level_name)
end

function Win:gamepadpressed(joystick, button)
  if self.waiting then return end
  self:gotoState("Menu", self.level_name)
end

function Win:exitedState()
  self.victorysound:stop()
end

return Win
