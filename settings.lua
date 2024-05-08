-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

settings["colorscheme"] = "catppuccin"

settings["gui_config"] = {
	font_name = "JetBrainsMonoNL Nerd Font",
	font_size = 11,
}

settings["disabled_plugins"] = {}

settings["lsp_deps"] = {
	"basedpyright",
}

settings["treesitter_deps"] = {} -- highlight

settings["null_ls_deps"] = { -- format
	"black", -- python format
}

settings["colorscheme"] = "monokai-nightasty"

return settings
