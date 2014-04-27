local Lose = Game:addState('Lose')

function Lose:enteredState()
end

function Lose:draw()
  g.setColor(COLORS.white:rgb())
  g.draw(self.final_screen, 0, 0)
  g.setColor(0, 0, 0, 255 / 2)
  g.rectangle("fill", 0, 0, g.getWidth(), g.getHeight())
  g.setColor(COLORS.white:rgb())
  g.draw(self.preloaded_images["lose.png"], 0, 0)
end

function Lose:keypressed(key, unicode)
  self:gotoState("Menu")
end

function Lose:joystickpressed(joystick, button)
  self:gotoState("Menu")
end

function Lose:exitedState()
end

return Lose
