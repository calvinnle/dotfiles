local wezterm = require("wezterm")
local brightness = 0.012
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font = wezterm.font("Iosevka Nerd Font", {
	weight = "Regular",
})

config.font_size = 13

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
config.color_scheme = "rose-pine"

config.window_padding = {
	left = 20,
	bottom = 0,
}

config.window_background_image_hsb = {
	-- Darken the background image by reducing it
	brightness = brightness,
	hue = 1.0,
	saturation = 0.8,
}

config.window_background_opacity = 0.975
config.macos_window_background_blur = 20

-- uncomment these if u wanna be cool - you're not

-- local background_folder = user_home .. "/Documents/wallpaper"
-- local user_home = os.getenv("HOME")
--
-- local bg_image = background_folder .. "/good.gif"
--
-- config.window_background_image = bg_image

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

return config
