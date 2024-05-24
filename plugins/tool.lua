local user_tool = {}

user_tool["keaising/im-select.nvim"] = {
	lazy = true,
	cond = vim.fn.executable("fcitx5-remote") == 1,
	event = "BufReadPost",
	config = function()
		require("im_select").setup({
			-- IM will be set to `default_im_select` in `normal` mode
			-- For Windows/WSL, default: "1033", aka: English US Keyboard
			-- For macOS, default: "com.apple.keylayout.ABC", aka: US
			-- For Linux, default:
			--               "keyboard-us" for Fcitx5
			--               "1" for Fcitx
			--               "xkb:us::eng" for ibus
			-- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
			default_im_select = "keyboard-us",

			-- Can be binary's name or binary's full path,
			-- e.g. 'im-select' or '/usr/local/bin/im-select'
			-- For Windows/WSL, default: "im-select.exe"
			-- For macOS, default: "im-select"
			-- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
			default_command = "fcitx5-remote",

			-- Restore the default input method state when the following events are triggered
			-- set_default_events = { "VimEnter", "FocusGained", "InsertLeave" },
			set_default_events = { "InsertLeave" },

			-- Show notification about how to install executable binary when binary missed
			keep_quiet_on_no_binary = false,

			-- Async run `default_command` to switch IM or not
			async_switch_im = true,
		})
	end,
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
