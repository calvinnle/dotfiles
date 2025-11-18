local wezterm = require("wezterm")
local brightness = 0.02
local config = wezterm.config_builder()

config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"

config.font = wezterm.font_with_fallback({
  {
    family = "DejaVuSansM Nerd Font",
    weight = "Regular",
    harfbuzz_features = { "liga=1", "clig=1", "calt=1" },
  }, -- Enable common ligatures
})

config.font_size = 14

config.colors = {
  background = "000000",

  -- for dark background
  cursor_fg = "black",
  cursor_bg = "white",

  -- for light background
  -- cursor_fg = "white",
  -- cursor_bg = "black",
}

-- config.color_scheme = "catppuccin-mocha"

config.window_padding = {
  -- left = 20,
  -- bottom = 0,
}

config.cursor_blink_rate = 100

config.window_background_image_hsb = {
  -- Darken the background image by reducing it
  brightness = brightness,
  hue = 1.0,
  saturation = 0.8,
}

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 30

-- uncomment these if u wanna be cool - you're not

-- local user_home = os.getenv("HOME")
-- local background_folder = user_home .. "/Documents/wallpaper"
--
-- local bg_image = background_folder .. "/stalenhag.jpg"
--
-- config.window_background_image = bg_image

return config
