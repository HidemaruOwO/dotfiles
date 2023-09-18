local wezterm = require("wezterm")
local gon = require("getOsName")
local os_name, arch_name = gon.get_os_name()
local hostname = require("hostname").getHostname()
local will_font_size
local mux = wezterm.mux
local act = wezterm.action

print(hostname)

if hostname == "Slime-MBA" then
	will_font_size = 13
elseif hostname == "Linux" then
	will_font_size = 11.5
end

-- wezterm cli spawn -- zenith
-- wezterm cli move-pane-to-new-tab

return {
	launch_menu = {
		{
			label = "Fish",
			args = { "fish", "-l" },
		},
	},
	--background setting
	window_background_opacity = 0.65,
	text_background_opacity = 0.65,
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
	font = wezterm.font("UDEV Gothic 35NFLG"),
	font_size = will_font_size,
	warn_about_missing_glyphs = false,
	adjust_window_size_when_changing_font_size = false,
	disable_default_key_bindings = true,

	keys = {
		-- Ctrl+hを左に移動
		{
			key = "h",
			mods = "CTRL",
			action = act.SendKey({ key = "LeftArrow" }),
		},
		-- Ctrl+jを下に移動
		{
			key = "j",
			mods = "CTRL",
			action = act.SendKey({ key = "DownArrow" }),
		},
		-- Ctrl+kを上に移動
		{
			key = "k",
			mods = "CTRL",
			action = act.SendKey({ key = "UpArrow" }),
		},
		-- Ctrl+lを右に移動
		{
			key = "l",
			mods = "CTRL",
			action = act.SendKey({ key = "RightArrow" }),
		},
		{ key = "C", mods = "SHIFT|CTRL", action = { CopyTo = "Clipboard" } },
		{ key = "V", mods = "SHIFT|CTRL", action = { PasteFrom = "Clipboard" } },
		{ key = "e", mods = "CTRL", action = act.SendString("snvim\n") },
		{ key = "h", mods = "ALT|CTRL", action = act({ MoveTabRelative = -1 }) },
		{ key = "l", mods = "ALT|CTRL", action = act({ ActivateTabRelative = 1 }) },
		{ key = "y", mods = "ALT|CTRL", action = "ActivateCopyMode" },
		{ key = "p", mods = "ALT|CTRL", action = act({ PasteFrom = "PrimarySelection" }) },
		{ key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },
		{ key = "-", mods = "ALT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "|", mods = "ALT|SHIFT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "e", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "q", mods = "ALT", action = act({ CloseCurrentTab = { confirm = false } }) },
		{ key = "h", mods = "ALT|SHIFT", action = act({ ActivateTabRelative = -1 }) },
		{ key = "l", mods = "ALT|SHIFT", action = act({ ActivateTabRelative = 1 }) },
		{ key = "[", mods = "ALT", action = act({ ActivatePaneDirection = "Left" }) },
		{ key = "]", mods = "ALT", action = act({ ActivatePaneDirection = "Right" }) },
		{ key = "{", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Up" }) },
		{ key = "}", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Down" }) },
		{ key = "h", mods = "ALT|SHIFT|CTRL", action = act({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "l", mods = "ALT|SHIFT|CTRL", action = act({ AdjustPaneSize = { "Right", 1 } }) },
		{ key = "k", mods = "ALT|SHIFT|CTRL", action = act({ AdjustPaneSize = { "Up", 1 } }) },
		{ key = "j", mods = "ALT|SHIFT|CTRL", action = act({ AdjustPaneSize = { "Down", 1 } }) },
		{ key = " ", mods = "ALT", action = "QuickSelect" },
		{ key = "o", mods = "ALT", action = "ShowTabNavigator" },
	},
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Middle" } },
			mods = "NONE",
			action = act.Nop,
		},
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "NONE",
			action = act.Nop,
		},
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
				italic = false,
			},

			new_tab_hover = {
				bg_color = "#444b71",
				fg_color = "#c6c8d1",
				italic = false,
			},
		},
	},
	--title
	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		return {
			{ Text = " " .. tab.active_pane.title .. " " },
		}
	end),
	wezterm.on("gui-startup", function()
		local tab, pane, window = mux.spawn_window({})
		pane:send_text("exit\n")
		window:spawn_tab({ args = { "btop" } })
		window:spawn_tab({ args = { "gh", "dash" } })
		window:spawn_tab({})
	end),
}
