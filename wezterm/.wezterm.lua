local wezterm = require("wezterm")
-- local io = require("io")
-- local os = require("os")
local brightness = 0.009
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font = wezterm.font("JetBrainsMono Nerd Font", {
  weight = "Regular",
})

config.font_size = 13

config.colors = {
  background = "black",

  -- for dark background
  cursor_fg = "black",
  cursor_bg = "white",

  -- for light background
  -- cursor_fg = "white",
  -- cursor_bg = "#082b63",
}

config.color_scheme = "catppuccin-mocha"

config.window_padding = {
  left = 20,
}

config.window_background_image_hsb = {
  -- Darken the background image by reducing it
  brightness = brightness,
  hue = 1.0,
  saturation = 0.8,
}

-- config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 30
--
-- local user_home = os.getenv("HOME")
-- local background_folder = user_home .. "/Documents/wallpaper"
--
-- -- default background
-- local bg_image = background_folder .. "/ace.jpg"
--
-- config.window_background_image = bg_image
-- end image setting
--
config.harfbuzz_features = { "calt=0" }
--
return config
