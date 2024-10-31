-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local launch_menu = {}
local keys = {}

-- This will hold the configuration.
local config = wezterm.config_builder()

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	--- Set Pwsh as the default on Windows
	config.default_prog = { "pwsh.exe", "-NoLogo" }

	table.insert(launch_menu, {
		label = "Pwsh",
		args = { "pwsh.exe", "-NoLogo" },
	})
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})
	table.insert(launch_menu, {
		label = "Pwsh No Profile",
		args = { "pwsh.exe", "-NoLogo", "-NoProfile" },
	})
	table.insert(launch_menu, {
		label = "PowerShell No Profile",
		args = { "powershell.exe", "-NoLogo", "-NoProfile" },
	})
end

config.font = wezterm.font("Hack Nerd Font", { weight = "Bold" })
config.font_size = 9

-- config.color_scheme = 'Gruvbox Dark (Gogh)'
-- config.color_scheme = 'Guezwhoz'
config.color_scheme = "jubi"
config.tab_bar_at_bottom = true
config.window_frame = {
	-- font = wezterm.font { family = 'Roboto', weight = 'Bold' },

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 8,

	-- The overall background color of the tab bar when
	-- the window is focused
	-- active_titlebar_bg = "#333333",

	-- The overall background color of the tab bar when
	-- the window is not focused
	-- inactive_titlebar_bg = "#333333",
}

config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 2000 }

config.window_background_opacity = 0.8
config.prefer_egl = true
-- config.win32_system_backdrop = 'Acrylic'

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_background_opacity == 0.8 then
		overrides.window_background_opacity = 1
	else
		overrides.window_background_opacity = 0.8
	end
	window:set_config_overrides(overrides)
end)

-- wezterm.on("decrease-opacity", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	overrides.window_background_opacity = overrides.window_background_opacity - 0.2
-- 	window:set_config_overrides(overrides)
-- end)
--
-- wezterm.on("increase-opacity", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	overrides.window_background_opacity = overrides.window_background_opacity + 0.2
-- 	window:set_config_overrides(overrides)
-- end)

keys = {

	-- TABS

	{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
	{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
	{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
	{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
	{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },
	{ key = "0", mods = "LEADER", action = act.ActivateTab(9) },

	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{
		mods = "LEADER",
		key = "t",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{ key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = ".", mods = "ALT", action = act.ActivateTabRelative(1) },
	{ key = ",", mods = "ALT", action = act.ActivateTabRelative(-1) },

	-- PANES

	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "H",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "V",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
 	{
		mods = "LEADER",
		key = "o",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
 -- 	{
 --    key = "<", mods = "ALT",
	-- 	action = wezterm.action.EmitEvent("decrease-opacity"),
	-- },
 -- 	{
 --    key = ">", mods = "ALT",
	-- 	action = wezterm.action.EmitEvent("increase-opacity"),
	-- },
	{
		mods = "CTRL",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "CTRL",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "CTRL",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "CTRL",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},

	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "k", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },

	-- OTHERS

	{
		key = "e",
		mods = "LEADER",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "f", mods = "LEADER", action = act.ActivateCommandPalette },
	{ key = "R", mods = "LEADER", action = act.ReloadConfiguration },
	{ key = "s", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },

	{
		key = "r",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	-- WINDOW

	{ key = "N", mods = "LEADER", action = act.SpawnWindow },
}

wezterm.on("update-right-status", function(window, _)
	local FOREGROUND = {}
	local BACKGROUND = {}
	local prefix = " " .. utf8.char(0x1f30a) -- ocean wave

	if window:leader_is_active() then
		FOREGROUND = { Foreground = { Color = "#fff" } }
		BACKGROUND = { Background = { Color = "#FFFF80" } }
	else
		FOREGROUND = { Foreground = { Color = "#fff" } }
		BACKGROUND = { Background = { Color = "#0b0022" } }
	end

	window:set_right_status(wezterm.format({
		BACKGROUND,
		{ Text = prefix },
		FOREGROUND,
	}))
end)

config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#0b0022",

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#2b2042",
			-- The color of the text for the tab
			fg_color = "#c0c0c0",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Normal",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "#1b1032",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#1b1032",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.launch_menu = launch_menu
config.keys = keys

-- and finally, return the configuration to wezterm
return config
