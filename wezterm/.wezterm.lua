local wezterm = require("wezterm")
local brightness = 0.02
local config = wezterm.config_builder()

config.enable_tab_bar = false
-- config.window_decorations = "RESIZE"

config.font = wezterm.font_with_fallback({
	{
		-- family = "Menlo",
		family = "Iosevka Nerd Font",
		weight = "Regular",
		-- harfbuzz_features = { "liga=1", "clig=1", "calt=1" },
	},
})

config.font_size = 14

config.colors = {
	background = "000000",

	-- for dark background
	cursor_fg = "000000",
	cursor_bg = "ffdd33",

	-- for light background
	-- cursor_fg = "black",
	-- cursor_bg = "ff00ff",
}

config.color_scheme = "Gruber (base16)"
-- config.color_scheme = "rose-pine"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 500

config.window_background_image_hsb = {
	brightness = brightness,
	hue = 1.0,
	saturation = 0.8,
}

-- config.window_background_opacity = 0.90
-- config.macos_window_background_blur = 15

-- uncomment these if u wanna be cool - you're not

-- local user_home = os.getenv("HOME")
-- local background_folder = user_home .. "/Documents/wallpaper"
--
-- local bg_image = background_folder .. "/stalenhag.jpg"
--
-- config.window_background_image = bg_image
--

return config
