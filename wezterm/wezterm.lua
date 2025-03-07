-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.audible_bell = "Disabled"

-- ms blink rate, set to 0 to disable blinking
config.cursor_blink_rate = 800

config.visual_bell = {
    fade_in_function = "EaseIn",
    fade_in_duration_ms = 150,
    fade_out_function = "EaseOut",
    fade_out_duration_ms = 150,
}

config.colors = {
    visual_bell = "#202020",
}

config.default_cursor_style = "BlinkingBar"

--config.font = 'FiraCode Nerd Font'
config.font_size = 10.5

-- For example, changing the color scheme:
config.color_scheme = "OneHalfDark"

config.hide_tab_bar_if_only_one_tab = true

config.pane_focus_follows_mouse = true

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

--[[
config.tab_bar_style = {
  active_tab_left = wezterm.format {
    { Background = { Color = '#0b0022' } },
    { Foreground = { Color = '#2b2042' } },
    { Text = SOLID_LEFT_ARROW },
  },
  active_tab_right = wezterm.format {
    { Background = { Color = '#0b0022' } },
    { Foreground = { Color = '#2b2042' } },
    { Text = SOLID_RIGHT_ARROW },
  },
  inactive_tab_left = wezterm.format {
    { Background = { Color = '#0b0022' } },
    { Foreground = { Color = '#1b1032' } },
    { Text = SOLID_LEFT_ARROW },
  },
  inactive_tab_right = wezterm.format {
    { Background = { Color = '#0b0022' } },
    { Foreground = { Color = '#1b1032' } },
    { Text = SOLID_RIGHT_ARROW },
  },
}
--]]

config.term = "wezterm"

local act = wezterm.action

config.keys = {
    { key = "w", mods = "ALT", action = act.CloseCurrentPane { confirm = false } },

    { key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },
    { key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },

    { key = "h", mods = "SHIFT|ALT", action = act.AdjustPaneSize { "Left", 4 } },
    { key = "l", mods = "SHIFT|ALT", action = act.AdjustPaneSize { "Right", 4 } },
    { key = "j", mods = "SHIFT|ALT", action = act.AdjustPaneSize { "Down", 4 } },
    { key = "k", mods = "SHIFT|ALT", action = act.AdjustPaneSize { "Up", 4 } },

    { key = "v", mods = "ALT", action = act.SplitVertical },
    { key = "s", mods = "ALT", action = act.SplitHorizontal },

    { key = "[", mods = "ALT", action = act.ActivateTabRelative(-1) },
    { key = "]", mods = "ALT", action = act.ActivateTabRelative(1) },
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
