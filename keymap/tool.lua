local bind = require("keymap.bind")
local map_callback = bind.map_callback
require("user.keymap.helpers")
return {

	["n|<leader>jj"] = map_callback(function()
			_toggle_ranger()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("git: Toggle ranger"),
	["t|b"] = map_callback(function()
			_toggle_ranger()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("git: Toggle ranger"),
}
