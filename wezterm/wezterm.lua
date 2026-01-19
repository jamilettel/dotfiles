-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 11
config.color_scheme = "Tango (terminal.sexy)"
-- config.color_scheme = "Tango (terminal.sexy)"

config.keys = {
	-- Turn off default keybindings
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = " ",
		mods = "SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Split horizontal
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	-- Split horizontal
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
}

-- Finally, return the configuration to wezterm:
return config
