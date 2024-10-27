local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.unix_domains = { { name = "unix" } }
config.default_gui_startup_args = { "connect", "unix", "fish", "--init-command", "btop" }
config.color_scheme = "Tokyo Night"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.keys = {
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}
return config
