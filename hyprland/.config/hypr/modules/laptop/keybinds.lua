-- Toggle touchpad (Copilot key on laptop)
local touchpad = "pixa3848:00-093a:3848-touchpad"
local touchpad_enabled = true

local functions = {}

functions.toggle_touchpad = function()
	touchpad_enabled = not touchpad_enabled
	hl.device({
		name = touchpad,
		enabled = touchpad_enabled,
	})
	if touchpad_enabled then
		hl.exec_cmd("notify-send -u low -t 2000 'Touchpad' 'Enabled 󰟜'")
	else
		hl.exec_cmd("notify-send -u low -t 2000 'Touchpad' 'Disabled 󰟙'")
	end
end

return functions
