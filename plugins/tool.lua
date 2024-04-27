local user_tool = {}

user_tool["pysan3/fcitx5.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	cond = vim.fn.executable("fcitx5-remote") == 1,
	config = require("tool.fcitx5"),
}

user_tool["skywind3000/asynctasks.vim"] = {
	lazy = true,
	dependencies = {
		"skywind3000/asyncrun.vim",
	},
	cmd = {
		"AsyncTask",
	},
	config = require("configs.tool.asynctasks"),
}

user_tool["nvimtools/hydra.nvim"] = {
	lazy = false,
	config = require("configs.tool.hydra"),
}

user_tool["kelly-lin/ranger.nvim"] = {
	lazy = false,
	config = require("configs.tool.ranger"),
}

user_tool["willothy/flatten.nvim"] = {
	lazy = false,
	config = true,
	opts = {
		callbacks = {
			pre_open = function()
				-- Close toggleterm when an external open request is received
				require("toggleterm").toggle(0)
			end,
			post_open = function(bufnr, winnr, ft, is_blocking)
				if ft == "gitcommit" then
					-- If the file is a git commit, create one-shot autocmd to delete it on write
					-- If you just want the toggleable terminal integration, ignore this bit and only use the
					-- code in the else block
					vim.api.nvim_create_autocmd("BufWritePost", {
						buffer = bufnr,
						once = true,
						callback = function()
							-- This is a bit of a hack, but if you run bufdelete immediately
							-- the shell can occasionally freeze
							vim.defer_fn(function()
								vim.api.nvim_buf_delete(bufnr, {})
							end, 50)
						end,
					})
				elseif not is_blocking then
					-- If it's a normal file, then reopen the terminal, then switch back to the newly opened window
					-- This gives the appearance of the window opening independently of the terminal
					require("toggleterm").toggle(0)
					vim.api.nvim_set_current_win(winnr)
				end
			end,
			block_end = function()
				-- After blocking ends (for a git commit, etc), reopen the terminal
				require("toggleterm").toggle(0)
			end,
		},
	},
}

return user_tool
