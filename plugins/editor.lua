user_editor = {}
user_editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("configs.editor.accelerated-jk"),
	-- config = require("user.configs.editor.accelerated-jk"),
}

user_editor["folke/flash.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("configs.editor.flash"),
}

user_editor["mizlan/iswap.nvim"] = {
	lazy = true,
	cmd = { "ISwap", "ISwapNode" },
}
return user_editor
