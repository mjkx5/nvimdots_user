local bind = require("keymap.bind")
local map_callback = bind.map_callback
local et = bind.escape_termcode
local map_cmd = bind.map_cmd

return {

	-- Plugin: accelerate-jk
	["n|j"] = map_callback(function()
		return et("<Plug>(accelerated_jk_gj)")
	end):with_expr(),
	["n|k"] = map_callback(function()
		return et("<Plug>(accelerated_jk_gk)")
	end):with_expr(),

	["o|w"] = map_cmd("W"):with_noremap():with_silent():with_desc(""),
	["o|W"] = map_cmd("w"):with_noremap():with_silent():with_desc(""),
	["o|e"] = map_cmd("E"):with_noremap():with_silent():with_desc(""),
	["o|E"] = map_cmd("e"):with_noremap():with_silent():with_desc(""),
	["o|b"] = map_cmd("B"):with_noremap():with_silent():with_desc(""),
	["o|B"] = map_cmd("b"):with_noremap():with_silent():with_desc(""),
}
