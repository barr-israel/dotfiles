local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.unix_domains = {
	{
		name = "unix",
	},
}
-- config.default_gui_startup_args = { "connect", "unix" }
config.color_scheme = "Tokyo Night"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
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
