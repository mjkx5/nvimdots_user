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

return user_tool
