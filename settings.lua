-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false

settings["colorscheme"] = "catppuccin"

settings["gui_config"] = {
	font_name = "JetBrainsMonoNL Nerd Font",
	font_size = 11,
}

settings["disabled_plugins"] = {
	"nvim-tree/nvim-tree.lua",
	"fatih/vim-go",
}

settings["lsp_deps"] = function(defaults)
	return {
		"bashls",
		"clangd",
		"html",
		"jsonls",
		"lua_ls",
		"lua_ls",
		"basedpyright",
	}
end

settings["treesitter_deps"] = function(defaults) -- highlight
	return {
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"gomod",
		"html",
		"javascript",
		"json",
		-- "latex", -- disable latex
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"typescript",
		"vimdoc",
		"vue",
		"yaml",
	}
end

settings["null_ls_deps"] = { -- format
	"black", -- python format
}

return settings
