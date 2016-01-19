local Main = Game:addState('Main')

function Main:enteredState(level_name)
  self.level_name = level_name
  love.physics.setMeter(32)
  World = love.physics.newWorld(0, 10 * 16, true)
  local physics_callback_names = {"begin_contact", "end_contact", "presolve", "postsolve"}
  local physics_callbacks = {}
  for _,callback_name in ipairs(physics_callback_names) do
    local function callback(fixture_a, fixture_b, contact, ...)
      local object_one, object_two = fixture_a:getUserData(), fixture_b:getUserData()
      -- print(callback_name, object_one, object_two, ...)
      local nx, ny = contact:getNormal()
      if object_one and is_func(object_one[callback_name]) then
        object_one[callback_name](object_one, object_two, contact, nx, ny, ...)
      end
      if object_two and is_func(object_two[callback_name]) then
        object_two[callback_name](object_two, object_one, contact, -nx, -ny, ...)
      end
    end
    self[callback_name] = callback
    table.insert(physics_callbacks, callback)
  end
  World:setCallbacks(unpack(physics_callbacks))

  local Camera = require("lib/camera")
  self.camera = Camera:new()

  self.default_font = g.newFont(16)
  g.setFont(self.default_font)

  level = MapLoader.load(level_name)
  self.camera:setScale(1 / level.scale, 1 / level.scale)

  local joysticks = love.joystick.getJoysticks()

  local p1X, p1Y = level.player1.x, level.player1.y
  local p2X, p2Y = level.player2.x, level.player2.y

  local radius = 19
  player1 = PlayerCharacter:new(p1X, p1Y, radius, radius)
  player1.player_name = "square"
  player1.jump_sound = self.preloaded_audio['sjump.ogg']
  player1.jump_sound:setVolume(0.2)
  player1.image = self.preloaded_images["player_square.png"]
  player1.image:setFilter("nearest", "nearest")
  game.preloaded_images["rec_blink.png"]:setFilter("nearest", "nearest")
  player1.active_anim = newAnimation(game.preloaded_images["rec_blink.png"], 21, 21, 0.1, 0)
  game.preloaded_images["rec_idle.png"]:setFilter("nearest", "nearest")
  player1.idle_anim = newAnimation(game.preloaded_images["rec_idle.png"], 21, 21, 0.1, 0)
  player1.current_anim = player1.active_anim
  player1.joystick = joysticks[1]
  player1.body = love.physics.newBody(World, p1X, p1Y, "dynamic")
  player1.shape = love.physics.newRectangleShape(0, 0, radius, radius)
  player1.fixture = love.physics.newFixture(player1.body, player1.shape)
  player1.fixture:setUserData(player1)
  player1.fixture:setFriction(1)
  player1.controls = {
    w = PlayerCharacter.up,
    a = PlayerCharacter.left,
    d = PlayerCharacter.right,
    joystick = {
      a = PlayerCharacter.up,
      dpleft = PlayerCharacter.left,
      dpright = PlayerCharacter.right
    }
  }

  radius = 20
  player2 = PlayerCharacter:new(p2X, p2Y, radius, radius)
  player2.player_name = "circle"
  player2.jump_sound = self.preloaded_audio['cjump.ogg']
  player2.jump_sound:setVolume(0.2)
  player2.image = self.preloaded_images["player_circle.png"]
  player2.image:setFilter("nearest", "nearest")
  game.preloaded_images["pi_blink.png"]:setFilter("nearest", "nearest")
  player2.active_anim = newAnimation(game.preloaded_images["pi_blink.png"], 21, 21, 0.1, 0)
  game.preloaded_images["pi_idle.png"]:setFilter("nearest", "nearest")
  player2.idle_anim = newAnimation(game.preloaded_images["pi_idle.png"], 21, 21, 0.1, 0)
  player2.current_anim = player2.active_anim
  player2.joystick = joysticks[2]
  player2.body = love.physics.newBody(World, p2X, p2Y, "dynamic")
  player2.shape = love.physics.newCircleShape(radius / 2)
  player2.fixture = love.physics.newFixture(player2.body, player2.shape)
  player2.fixture:setUserData(player2)
  player2.fixture:setFriction(1)
  player2.body:setAngularDamping(2)
  player2.controls = {
    up = PlayerCharacter.up,
    left = PlayerCharacter.left,
    right = PlayerCharacter.right,
    joystick = {
      a = PlayerCharacter.up,
      dpleft = PlayerCharacter.left,
      dpright = PlayerCharacter.right
    }
  }

  local rope_length = 100
  rope = love.physics.newRopeJoint( player1.body, player2.body, p1X, p1Y, p2X, p2Y, rope_length, true)
  catenary = Catenary(p1X, p1Y, p2X, p2Y, rope_length)

  self.rope_segments = {}
  self.rope_segments[0] = player1.image
  self.rope_segments[1] = player2.image

  self.clouds = {}
  local cloud_images = {
    self.preloaded_images["cloud1.png"],
    self.preloaded_images["cloud2.png"],
    self.preloaded_images["cloud3.png"],
  }
  for _,image in ipairs(cloud_images) do
    image:setFilter("nearest", "nearest")
  end
  local function spawn_cloud(x, y)
    local cloud = {
      image = cloud_images[math.random(#cloud_images)],
      position = { x = x, y = y },
      vx = -math.random() * 50 - 50,
      scale = math.random(3)
    }
    self.clouds[cloud] = cloud
  end
  local function spawn_left()
    local x, y, w, h = self.camera:getViewport()
    spawn_cloud(x + w, y + math.random(h))
  end
  cron.every(3, spawn_left)
  spawn_left()
  for i=1,5 do
    local x, y, w, h = self.camera:getViewport()
    spawn_cloud(math.random(w), math.random(h))
  end

  local friendsound = self.preloaded_audio['friend.ogg']
  friendsound:rewind()
  friendsound:setVolume(0.1)
  friendsound:play()

  self.bgm = self.preloaded_audio['music1.ogg']
  self.bgm:setVolume(0.4)
  self.bgm:setLooping(true)
  self.bgm:play()
end

function Main:update(dt)
  World:update(dt)
  if World == nil then return end

  for _,trigger in pairs(level.triggers) do
    if trigger.update then trigger:update(dt) end
  end

  for _,cloud in pairs(self.clouds) do
    cloud.position.x = cloud.position.x + cloud.vx * dt
  end

  local cx, cy, num_players = 0, 0, 0
  for _,player in pairs(PlayerCharacter.instances) do
    player:update(dt)
    local px, py = player.body:getWorldCenter()
    cx, cy = cx + px, cy + py
    num_players = num_players + 1
  end
  cx, cy = cx / num_players, cy / num_players
  cx, cy = cx - g.getWidth() / 8, cy - g.getHeight() / 8
  cx, cy = math.floor(cx * level.scale) / level.scale, math.floor(cy * level.scale) / level.scale
  self.camera:setPosition(cx, cy)

  local p1X, p1Y = player1.body:getWorldCenter()
  local p2X, p2Y = player2.body:getWorldCenter()
  if p1X < p2X then
    catenary:updatePoints(p1X, p1Y, p2X, p2Y)
  else
    catenary:updatePoints(p2X, p2Y, p1X, p1Y)
  end
end

function Main:draw()
  g.setColor(COLORS.white:rgb())
  local bg = self.preloaded_images["bg.png"]
  g.draw(bg, 0, 0, 0, g.getWidth() / bg:getWidth(), g.getHeight() / bg:getHeight())

  self.camera:set()

  for _,cloud in pairs(self.clouds) do
    g.draw(cloud.image, cloud.position.x, cloud.position.y, 0, cloud.scale)
  end

  g.setColor(COLORS.white:rgb())
  g.draw(level.tile_layers["Background"].sprite_batch)

  for _,trigger in pairs(level.triggers) do
    if trigger.draw then trigger:draw() end
  end

  local rx1, ry1, rx2, ry2 = rope:getAnchors()
  local rv = Vector.new(rx2 - rx1, ry2 - ry1)
  local dx, dy = rv:normalized():unpack()

  local dx, dy = rx2 - rx1, ry2 - ry1
  local player_distance = math.sqrt(dx * dx + dy + dy)
  dx, dy = dx / player_distance, dy / player_distance

  g.setColor(COLORS.white:rgb())
  for index = 0, player_distance, 5 do
    local x =  rx1 + dx * index
    g.draw(self.rope_segments[index % 2], x, catenary[x], 0, 0.25, 0.25)
  end

  g.setColor(COLORS.blue:rgb())
  for _,player in pairs(PlayerCharacter.instances) do
    player:draw()
  end

  g.setColor(COLORS.white:rgb())
  g.draw(level.tile_layers["Foreground"].sprite_batch)

  self.camera:unset()
end

function Main:victory()
  self:gotoState("Win")
end

function Main:failure()
  self:gotoState("Lose")
end

function Main:mousepressed(x, y, button)
end

function Main:mousereleased(x, y, button)
end

function Main:keypressed(key, unicode)
  if key == "r" then
    self:gotoState("Main", self.level_name)
  elseif key == "escape" then
    self:gotoState("Menu", self.level_name)
  end
end

function Main:keyreleased(key, unicode)
end

function Main:gamepadpressed(joystick, button)
  if button == "start" then
    self:gotoState("Main", self.level_name)
  elseif button == "back" or button == "b" then
    self:gotoState("Menu", self.level_name)
  end
end

function Main:joystickreleased(joystick, button)
end

function Main:focus(has_focus)
end

function Main:exitedState()
  self.bgm:stop()

  cron.reset()
  self.final_screen = g.newImage(g.newScreenshot())
  World:destroy()
  World = nil
  for id,player in pairs(PlayerCharacter.instances) do
    PlayerCharacter.instances[id] = nil
  end
end

return Main
