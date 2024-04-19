local _lazyranger = nil
_G._toggle_ranger = function()
	if vim.fn.executable("ranger") == 1 then
		if not _lazyranger then
			_lazyranger = require("toggleterm.terminal").Terminal:new({
				cmd = "ranger " .. vim.fn.expand("%:p:h"),
				direction = "float",
				close_on_exit = true,
				hidden = true,
			})
		end
		_lazyranger:toggle()
	else
		vim.notify("Command [ranger] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
	end
end
