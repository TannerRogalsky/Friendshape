local Lose = Game:addState('Lose')

function Lose:enteredState()
  self.waiting = true
  cron.after(0.5, function()
    self.waiting = false
  end)

  self.failuresound = love.audio.newSource( "/sounds/failuresound.ogg", "static" )
  self.failuresound:setVolume(0.2)
  self.failuresound:play()
end

function Lose:draw()
  g.setColor(COLORS.white:rgb())
  g.draw(self.final_screen, 0, 0)
  g.setColor(0, 0, 0, 255 / 2)
  g.rectangle("fill", 0, 0, g.getWidth(), g.getHeight())
  g.setColor(COLORS.white:rgb())
  local fg = self.preloaded_images["lose.png"]
  g.draw(fg, 0, 0, 0, g.getWidth() / fg:getWidth(), g.getHeight() / fg:getHeight())
end

function Lose:keypressed(key, unicode)
  if self.waiting then return end
  self:gotoState("Main", self.level_name)
end

function Lose:gamepadpressed(joystick, button)
  if self.waiting then return end
  self:gotoState("Main", self.level_name)
end

function Lose:exitedState()
  self.failuresound:stop()
end

return Lose
