local Game = class('Game', Base):include(Stateful)

function Game:initialize(args)
  Base.initialize(self)

  if args.debug then
    love.audio.setVolume(0)
  end

  if love.joystick then
    local joysticks = love.joystick.getJoysticks()
    for i, joystick in ipairs(joysticks) do
      if joystick:getName() == "OUYA Game Controller" then
        local guid = joystick:getGUID()
        love.joystick.setGamepadMapping(guid, "a", "button", 1)
        love.joystick.setGamepadMapping(guid, "b", "button", 2)
        love.joystick.setGamepadMapping(guid, "x", "button", 3)
        love.joystick.setGamepadMapping(guid, "y", "button", 4)
        love.joystick.setGamepadMapping(guid, "dpup", "button", 12)
        love.joystick.setGamepadMapping(guid, "dpdown", "button", 13)
        love.joystick.setGamepadMapping(guid, "dpleft", "button", 14)
        love.joystick.setGamepadMapping(guid, "dpright", "button", 15)
        love.joystick.setGamepadMapping(guid, "back", "button", 10)
        love.joystick.setGamepadMapping(guid, "start", "button", 11)
      end
    end
  end

  self:gotoState("Loading")
end

function Game:update(dt)
end

function Game:draw()
end

function Game:mousepressed(x, y, button)
end

function Game:mousereleased(x, y, button)
end

function Game:keypressed(key, unicode)
end

function Game:keyreleased(key, unicode)
end

function Game:joystickpressed(joystick, button)
end

function Game:joystickreleased(joystick, button)
end

function Game:gamepadaxis(joystick, axis, value)
end

function Game:gamepadpressed(joystick, button)
end

function Game:gamepadreleased(joystick, button)
end

function Game:joystickadded(joystick)
end

function Game:joystickremoved(joystick)
end

function Game:joystickaxis(joystick, axis, value)
end

function Game:joystickhat(joystick, hat, direction)
end

function Game:textinput(text)
end

function Game:focus(has_focus)
end

function Game:quit()
end

return Game
