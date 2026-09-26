local utils = require("modules.utils")

local terminal = "kitty"
local fileManager = "thunar"
local menu = "wofi --show drun"

local mod = "SUPER"
local modShift = "SUPER + SHIFT"

if utils.hostname == "sun" then
    ;
elseif utils.hostname == "mars" then
    local keybinds = require("modules.laptop.keybinds")

    hl.bind(modShift .. " + F23", function()
        keybinds.toggle_touchpad()
    end)
end

-- Applications
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + N", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(mod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("pycharm"))
hl.bind(mod .. " + M", hl.dsp.exec_cmd("thunderbird"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))

-- Exit Hyprland
hl.bind(
	mod .. " + END",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)

-- Window management
hl.bind(mod .. " + X", hl.dsp.window.close())
hl.bind(mod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + I", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + F11", hl.dsp.window.fullscreen_state({ internal = 0, client = 0, action = "toggle" }))

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region --freeze"))

-- Lock screen
hl.bind(mod .. " + HOME", hl.dsp.exec_cmd("hyprlock"))

-- Focus movement (vim-style)
hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move window (vim-style)
hl.bind(modShift .. " + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(modShift .. " + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(modShift .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(modShift .. " + L", hl.dsp.window.move({ direction = "right" }))

-- Switch workspaces / move window to workspace (1-10)
local function switch_workspace(n)
	local monitor = hl.get_active_monitor()
	local offset
	if monitor.name == "DP-1" then
		offset = 0
	elseif monitor.name == "DP-3" then
		offset = 10
	elseif monitor.name == "eDP-1" then
		offset = 20
	else
		offset = 30
	end
	hl.dispatch(hl.dsp.focus({ workspace = n + offset }))
end

local function move_to_workspace(n)
	local monitor = hl.get_active_monitor()
	local offset
	if monitor.name == "DP-1" then
		offset = 0
	elseif monitor.name == "DP-3" then
		offset = 10
	elseif monitor.name == "eDP-1" then
		offset = 20
	else
		offset = 30
	end
	hl.dispatch(hl.dsp.window.move({ workspace = n + offset }))
end

for i = 1, 10 do
	local key = tostring(i % 10)
	hl.bind(mod .. " + " .. key, function()
		switch_workspace(i)
	end)
	hl.bind(modShift .. " + " .. key, function()
		move_to_workspace(i)
	end)
end

-- Special workspace (scratchpad)
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(modShift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with mouse wheel
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Drag / resize windows with mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia & brightness (repeating + works on lock screen)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Playerctl (media controls)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
