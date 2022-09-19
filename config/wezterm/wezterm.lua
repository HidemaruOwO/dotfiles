local wezterm = require 'wezterm';
local gon = require("getOsName")
local os_name, arch_name = gon.get_os_name()
local will_font_size
local mux = wezterm.mux


if os_name == "Mac" then
	will_font_size = 13
  elseif os_name == "Linux" then
  will_font_size = 10
end

  -- wezterm cli spawn -- zenith
  -- wezterm cli move-pane-to-new-tab

return {
	launch_menu = {
    {
      label="Fish",
      args = {"fish","-l"},
    },
  },
  --background setting
  window_background_opacity = 0.5,
	window_background_image_hsb = {
		brightness = 0.15,
		saturation = 1.0,
	},

  --tab bar setting
  tab_bar_at_bottom = true,

	-- disable_default_key_bindings = true,
	color_scheme = "nord",
	use_ime = true,
  --font setting
  font = wezterm.font("Hack Nerd Font"),
  font_size = will_font_size,
  
  warn_about_missing_glyphs=false,

	
  adjust_window_size_when_changing_font_size = false,
	-- disable_default_key_bindings = true,

	keys = {
		{key="C", mods="SHIFT|CTRL", action="Copy"},
		{key="V", mods="SHIFT|CTRL", action="Paste"},

		{ key = "h", mods = "ALT|CTRL", action = wezterm.action({ MoveTabRelative = -1 }) },
		{ key = "l", mods = "ALT|CTRL", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "y", mods = "ALT|CTRL", action = "ActivateCopyMode" },


		{ key = "p", mods = "ALT|CTRL", action = wezterm.action({ PasteFrom = "PrimarySelection" }) },

		{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = wezterm.action({ ActivateTab = 8 }) },

		{ key = "-", mods = "ALT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "|", mods = "ALT|SHIFT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

		{ key = "e", mods = "ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "q", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
		{ key = "h", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "l", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTabRelative = 1 }) },


		{ key = "[", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "]", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "{", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "}", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },

		{ key = "h", mods = "ALT|SHIFT|CTRL", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "l", mods = "ALT|SHIFT|CTRL", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },
		{ key = "k", mods = "ALT|SHIFT|CTRL", action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }) },
		{ key = "j", mods = "ALT|SHIFT|CTRL", action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }) },

		{ key = " ", mods = "ALT", action = "QuickSelect" },

		{key="o", mods="ALT", action="ShowTabNavigator"},
  },


  -- Middle mouse button pastes the clipboard.
  -- Note that this is the default so you needn't copy this.
  mouse_bindings = {
    {
      event={Up={streak=1, button="Middle"}},
      mods="NONE",
      action="Paste",
    }
  }, 
  -- tab bar
  use_fancy_tab_bar = false,
  colors = {
    tab_bar = {
      background = "#1b1f2f",

      active_tab = {
        bg_color = "#444b71",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = "#282d3e",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = false,
        strikethrough = false,
      },

      inactive_tab_hover = {
        bg_color = "#1b1f2f",
        fg_color = "#c6c8d1",
        intensity = "Normal",
        underline = "None",
        italic = true,
        strikethrough = false,
      },

      new_tab = {
        bg_color = "#1b1f2f",
        fg_color = "#c6c8d1",
        italic = false
      },

      new_tab_hover = {
        bg_color = "#444b71",
        fg_color = "#c6c8d1",
        italic = false
      },
    },
  },
  --title
  wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    return {
      {Text=" " .. tab.active_pane.title .. " "},
    }
  end),

  wezterm.on("gui-startup",function ()
    local tab, pane, window = mux.spawn_window{}
    pane:send_text("zenith\n")
    window:spawn_tab{}
  end),
  
}
