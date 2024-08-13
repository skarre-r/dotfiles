local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- general
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400
config.automatically_reload_config = true
config.native_macos_fullscreen_mode = false
config.detect_password_input = true

-- font
config.font = wezterm.font({ family = "MesloLGS Nerd Font", weight = "Medium" })
config.font_rules = {
    {
        intensity = "Bold",
        italic = false,
        font = wezterm.font({ family = "MesloLGS Nerd Font", weight = "Bold" })
    },
    {
        intensity = "Bold",
        italic = true,
        font = wezterm.font({ family = "MesloLGS Nerd Font", weight = "Bold", italic = true })
    },
    {
        intensity = "Normal",
        italic = false,
        font = wezterm.font({ family = "MesloLGS Nerd Font", weight = "DemiBold" })
    },
    {
        intensity = "Normal",
        italic = true,
        font = wezterm.font({ family = "MesloLGS Nerd Font", weight = "DemiBold", italic = true })
    },
    {
        intensity = "Half",
        italic = false,
        font = wezterm.font({ family = "MesloLGS Nerd Font", weight = "Regular" })
    },
    {
        intensity = "Half",
        italic = true,
        font = wezterm.font({ family = "MesloLGS Nerd Font", weight = "Regular", italic = true })
    }
}
config.font_size = 14
config.cell_width = 1.0
config.line_height = 1.0
config.bold_brightens_ansi_colors = "BrightAndBold"
config.freetype_load_flags = "NO_HINTING|NO_AUTOHINT"
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
config.underline_position = -2
config.underline_thickness = 1.0 -- does nothing?

-- gpu
local gpus = wezterm.gui.enumerate_gpus()
config.webgpu_preferred_adapter = gpus[1]
config.front_end = "WebGpu" -- "OpenGL" | "Software" | "WebGpu"
config.webgpu_force_fallback_adapter = true

-- colors
config.color_scheme = 'Monokai Pro (Gogh)'
config.colors = {
    foreground = '#f9f9f9',
    background = '#2c2a2d',
    selection_bg = '#5a595b',
    tab_bar = {
        background = '#2c2a2d',
        inactive_tab_edge = "#2c2a2d",
        active_tab = {
            bg_color = "#2c2a2d",
            fg_color = '#f9f9f9',
            intensity = "Bold",
        },
        inactive_tab = {
            bg_color = "#2c2a2d",
            fg_color = '#717071',
            intensity = "Half",
        },
        inactive_tab_hover = {
            bg_color = "#2c2a2d",
            fg_color = '#c0c0c0',
            intensity = "Half",
            italic = true,
        },
    }
}

-- cursor
config.default_cursor_style = 'SteadyBlock'
config.cursor_thickness = 1

-- tabs
config.enable_tab_bar = true
config.use_fancy_tab_bar = true -- todo
config.show_tabs_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.window_frame = {
    font = wezterm.font({ family = "Menlo", weight = "Medium" }),
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
    top = 1, -- bc tab bar
    bottom = 16
}
config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE|MACOS_FORCE_ENABLE_SHADOW"

-- scroll
config.enable_scroll_bar = false
config.scrollback_lines = 3500

-- nightly
-- config.show_close_tab_button_in_tabs = false


return config
