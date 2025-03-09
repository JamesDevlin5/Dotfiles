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
-- if (system.exec("hostname") == 'james-Latitude-7490') then
--     config.font_size = 11.0
-- else
    config.font_size = 10.5
-- end

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
    -- Make Page up/down work
	{ key = 'PageUp', action = wezterm.action.ScrollByPage(-1) },
	{ key = 'PageDown', action = wezterm.action.ScrollByPage(1) },

    -- Jump word to the left
	{
		key = 'LeftArrow',
		mods = 'CTRL',
		action = wezterm.action.SendKey({ key = 'b', mods = 'ALT' }),
	},
	-- Jump word to the right
	{
		key = 'RightArrow',
		mods = 'CTRL',
		action = wezterm.action.SendKey({ key = 'f', mods = 'ALT' }),
	},

	-- Go to beginning of line
	{
		key = 'LeftArrow',
		mods = 'CTRL',
		action = wezterm.action.SendKey({
		key = 'a',
		mods = 'CTRL|SHIFT',
		}),
	},
	-- Go to end of line
	{
		key = 'RightArrow',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SendKey({ key = 'e', mods = 'CTRL' }),
	},

	-- Go to beginning of line
	{
		key = 'h',
		mods = 'CTRL',
		action = wezterm.action.SendKey({
		key = 'a',
		mods = 'CTRL|SHIFT',
		}),
	},
	-- Go to end of line
	{
		key = 'l',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SendKey({ key = 'e', mods = 'CTRL' }),
	},

    -- w closes pane
    { key = "w", mods = "ALT", action = act.CloseCurrentPane { confirm = false } },

    -- vim keys to navigate panes
    { key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },
    { key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },

    -- shift-vim keys to adjust pane sizes
    { key = "h", mods = "SHIFT|ALT", action = act.AdjustPaneSize { "Left", 4 } },
    { key = "l", mods = "SHIFT|ALT", action = act.AdjustPaneSize { "Right", 4 } },
    { key = "j", mods = "SHIFT|ALT", action = act.AdjustPaneSize { "Down", 4 } },
    { key = "k", mods = "SHIFT|ALT", action = act.AdjustPaneSize { "Up", 4 } },

    -- splitting
    { key = "v", mods = "ALT", action = act.SplitVertical },
    { key = "s", mods = "ALT", action = act.SplitHorizontal },

    -- switching between active panes
    { key = "[", mods = "ALT", action = act.ActivateTabRelative(-1) },
    { key = "]", mods = "ALT", action = act.ActivateTabRelative(1) },

    -- Rename tab title
	{
		key = 'R',
		mods = 'ALT|SHIFT',
		action = wezterm.action.PromptInputLine {
			description = 'Enter new name for tab',
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		},
	},
}

-- Mouse
config.mouse_bindings = {
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'NONE',
		action = wezterm.action.CompleteSelection('ClipboardAndPrimarySelection'),
	},

	-- Open links on Cmd+click
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
  }

local mux = wezterm.mux

-- Open wezterm in full screen
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
