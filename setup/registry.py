"""Calls the setup script for registered tools"""

wezterm = Registry("Wezterm")

wezterm.set_dotfiles_base_dir(".dotfiles/wezterm")
wezterm.set_config_base_dir(".config/wezterm")

wezterm.add_association(".dotfiles/wezterm/wezterm.lua", ".config/wezterm/wezterm.toml")
wezterm = {
    ".dotfiles/wezterm/stylua.toml": ".config/wezterm/stylua.toml"
}
