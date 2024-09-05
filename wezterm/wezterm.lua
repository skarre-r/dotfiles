local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- general
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400
config.automatically_reload_config = true
config.native_macos_fullscreen_mode = false
config.detect_password_input = true
config.default_cwd = wezterm.home_dir
config.set_environment_variables = {
	TERMINAL_EMULATOR = "wezterm",
	WEZTERM = "1",
}

-- font
config.font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Medium", stretch = "Normal" })
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Bold",
			stretch = "Normal",
			style = "Normal",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Bold",
			italic = true,
			stretch = "Normal",
			style = "Italic",
		}),
	},
	{
		intensity = "Normal",
		italic = false,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Medium",
			stretch = "Normal",
			style = "Normal",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Medium",
			italic = true,
			stretch = "Normal",
			style = "Italic",
		}),
	},
	{
		intensity = "Half",
		italic = false,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Regular",
			stretch = "Normal",
			style = "Normal",
		}),
	},
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = "Regular",
			italic = true,
			stretch = "Normal",
			style = "Italic",
		}),
	},
}
config.font_size = 13
config.cell_width = 0.9
config.line_height = 1.0
config.bold_brightens_ansi_colors = "BrightAndBold"
config.freetype_interpreter_version = 35
config.freetype_load_flags = "NO_HINTING|NO_AUTOHINT"
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"
config.underline_position = -2
config.underline_thickness = 1.0 -- does nothing?
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 1.0,
}

-- gpu
local gpus = wezterm.gui.enumerate_gpus()
config.webgpu_preferred_adapter = gpus[1]
config.front_end = "WebGpu" -- "OpenGL" | "Software" | "WebGpu"
config.webgpu_force_fallback_adapter = true

-- colors
config.color_scheme = "Monokai Pro (Gogh)"
config.colors = {
	foreground = "#f9f9f9",
	background = "#2c2a2d",
	selection_bg = "#5a595b",
	tab_bar = {
		background = "#2c2a2d",
		inactive_tab_edge = "#2c2a2d",
		active_tab = {
			bg_color = "#2c2a2d",
			fg_color = "#f9f9f9",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#2c2a2d",
			fg_color = "#717071",
			intensity = "Half",
		},
		inactive_tab_hover = {
			bg_color = "#2c2a2d",
			fg_color = "#c0c0c0",
			intensity = "Half",
			italic = true,
		},
	},
}

-- cursor
config.default_cursor_style = "SteadyBlock"
config.cursor_thickness = 1

-- tabs
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Medium" }),
	font_size = 12.0,
	active_titlebar_bg = "#2c2a2d",
	inactive_titlebar_bg = "#2c2a2d",
}
-- todo open new tabs in $HOME?

-- window
config.initial_cols = 80
config.initial_rows = 24
config.window_padding = {
	left = 16,
	right = 16,
	top = 16, -- TODO: reduce if tab bar is visible
	bottom = 16,
}
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE|MACOS_FORCE_ENABLE_SHADOW"
config.adjust_window_size_when_changing_font_size = false

-- scroll
config.enable_scroll_bar = false
config.scrollback_lines = 3500

-- keybinds
config.enable_kitty_keyboard = true
config.keys = {
	{ mods = "CMD", key = "+", action = wezterm.action.IncreaseFontSize },
	{ mods = "CMD", key = "-", action = wezterm.action.DecreaseFontSize },
	{ mods = "CMD", key = "w", action = wezterm.action.DisableDefaultAssignment },
	{ mods = "CMD", key = "m", action = wezterm.action.DisableDefaultAssignment },
	{ mods = "CMD", key = "f", action = wezterm.action.DisableDefaultAssignment },
	{ mods = "CMD", key = "Backspace", action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }) },
	{
		mods = "CMD",
		key = "d",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{ mods = "SHIFT|CMD", key = "d", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- {
	-- 	mods = "CMD",
	-- 	key = "t",
	-- 	action = wezterm.action.Multiple({
	-- 		wezterm.action.SpawnTab("CurrentPaneDomain"),
	-- 		wezterm.action.EmitEvent("tabs-changed"),
	-- 	}),
	-- },
}

-- multiplexing
config.unix_domains = { { name = "unix", no_serve_automatically = true } }
config.default_gui_startup_args = { "connect", "local" }

-- nightly
config.show_close_tab_button_in_tabs = false

-- wezterm.on("tabs-changed", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	local current_window_id = window:window_id()
-- 	local current_window = wezterm.mux.get_window(current_window_id)
-- 	local tabs = current_window:tabs()
-- 	if #tabs > 1 then
-- 		overrides.window_padding = {
-- 			left = 16,
-- 			right = 16,
-- 			top = 1,
-- 			bottom = 16,
-- 		}
-- 	else
-- 		overrides.window_padding = {
-- 			left = 16,
-- 			right = 16,
-- 			top = 16,
-- 			bottom = 16,
-- 		}
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

return config
