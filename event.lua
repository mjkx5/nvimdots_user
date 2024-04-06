local definitions = {
	-- Example
	bufs = {
		{ "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile" },
		{ "InsertLeave", "_ :silent", "!fcitx5-remote e -c" },
		{ "BufCreate", "_", ":silent !fcitx5-remote -c" },
		{ "BufEnter", "_", ":silent !fcitx5-remote - c " },
		{ "BufLeave", "_", ":silent !fcitx5-remote - c " },
	},
}

return definitions
