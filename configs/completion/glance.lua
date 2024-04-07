return function()
	local actions = require("glance").actions

	require("modules.utils").load_plugin("glance", {
		height = 35,

		mappings = {
			list = {
				["<C-h>"] = actions.enter_win("preview"), -- Focus preview window
			},
			preview = {
				["<C-l>"] = actions.enter_win("list"), -- Focus list window
			},
		},
	})
end
