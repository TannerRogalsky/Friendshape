return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 20,
  height = 20,
  tilewidth = 21,
  tileheight = 21,
  properties = {
    ["order"] = "1",
    ["player1_pos"] = "9,2",
    ["player2_pos"] = "7,2",
    ["scale"] = "3"
  },
  tilesets = {
    {
      name = "tiles",
      firstgid = 1,
      filename = "../images/tiles.tsx",
      tilewidth = 21,
      tileheight = 21,
      spacing = 2,
      margin = 2,
      image = "../images/spritesheet.png",
      imagewidth = 692,
      imageheight = 692,
      properties = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Background",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 221, 0, 221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 18, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "Foreground",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      visible = true,
      opacity = 1,
      properties = {
        ["physics"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 175, 0, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 212, 124, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 175, 0, 0, 0, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 212, 216, 0, 0, 0, 212, 216, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 175, 0, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 212, 124, 124, 124, 124, 124, 216, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 127, 175, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 175, 153, 175, 153, 175, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 153, 0, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 153, 161, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 182, 185, 186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 176, 162, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 274, 122, 275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 272, 332, 273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "Physics",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 147,
          y = 63,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 63, y = 0 },
            { x = 46, y = 12 },
            { x = 15, y = 12 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 105,
          y = 105,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 42, y = 0 },
            { x = 30, y = 9 },
            { x = 10, y = 12 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 105,
          y = 147,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 21, y = 0 },
            { x = 21, y = 13 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 231,
          y = 147,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 21, y = 0 },
            { x = 0, y = 12 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 147,
          y = 147,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = -20, y = 0 },
            { x = 84, y = 0 },
            { x = 84, y = 12 },
            { x = -21, y = 12 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 210,
          y = 105,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 42, y = 0 },
            { x = 23, y = 12 },
            { x = 6, y = 8 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 147,
          y = 189,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 0, y = 21 },
            { x = 0, y = 84 },
            { x = 22, y = 106 },
            { x = 21, y = 0 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 189,
          y = 210,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 1, y = 85 },
            { x = 21, y = 64 },
            { x = 20, y = 0 },
            { x = 0, y = -21 }
          },
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 168,
          y = 273,
          width = 21,
          height = 21,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 168,
          y = 357,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -11, y = 13 },
            { x = -9, y = 28 },
            { x = 1, y = 33 },
            { x = 21, y = 33 },
            { x = 29, y = 27 },
            { x = 31, y = 12 },
            { x = 21, y = 0 }
          },
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "Triggers",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 168,
          y = 336,
          width = 21,
          height = 21,
          visible = true,
          properties = {
            ["player"] = "square",
            ["type"] = "Goal"
          }
        },
        {
          name = "",
          type = "",
          shape = "rectangle",
          x = 168,
          y = 252,
          width = 21,
          height = 21,
          visible = true,
          properties = {
            ["player"] = "circle",
            ["type"] = "Goal"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 193,
          y = 32,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "square",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 214,
          y = 94,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "square",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 194,
          y = 138,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "square",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 193,
          y = 347,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "square",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 151,
          y = 347,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "square",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 151,
          y = 32,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "circle",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 130,
          y = 95,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "circle",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 151,
          y = 137,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "circle",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 172,
          y = 222,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "circle",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 172,
          y = 200,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "circle",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 214,
          y = 221,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "circle",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 130,
          y = 221,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "1",
            ["on_enter"] = "coin_enter",
            ["on_update"] = "bounce_animation",
            ["player"] = "circle",
            ["tile_layer"] = "Foreground"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 173,
          y = 326,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "2",
            ["on_update"] = "bounce_animation",
            ["tile_layer"] = "Background"
          }
        },
        {
          name = "",
          type = "",
          shape = "polygon",
          x = 172,
          y = 242,
          width = 0,
          height = 0,
          visible = true,
          polygon = {
            { x = 2, y = -1 },
            { x = 4, y = -5 },
            { x = 10, y = -4 },
            { x = 10, y = 0 },
            { x = 5, y = 4 }
          },
          properties = {
            ["amplitude"] = "2",
            ["on_update"] = "bounce_animation",
            ["tile_layer"] = "Background"
          }
        }
      }
    }
  }
}
