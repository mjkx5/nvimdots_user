return function()
	local Hydra = require("hydra")
	local cmd = require("hydra.keymap-util").cmd

	-- 	local hint = [[
	--                   _f_: files       _m_: marks
	--     🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files   _g_: live grep
	--    🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects    _/_: search in file
	--    🭅█ ▁     █🭐
	--    ██🬿      🭊██   _r_: resume      _u_: undotree
	--   🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _h_: vim help    _c_: execute command
	--   🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _k_: keymaps     _;_: commands history
	--                   _O_: options     _?_: search history
	--   ^
	--                   _<Enter>_: Telescope           _<Esc>_
	--  ]]
	--
	-- 	Hydra({
	-- 		name = "Telescope",
	-- 		hint = hint,
	-- 		config = {
	-- 			color = "teal",
	-- 			invoke_on_body = true,
	-- 			hint = {
	-- 				position = "middle",
	-- 			},
	-- 		},
	-- 		mode = "n",
	-- 		-- body = "<Leader>f",
	-- 		body = "mf",
	-- 		heads = {
	-- 			{ "f", cmd("Telescope find_files") },
	-- 			{ "g", cmd("Telescope live_grep") },
	-- 			{ "o", cmd("Telescope oldfiles"), { desc = "recently opened files" } },
	-- 			{ "h", cmd("Telescope help_tags"), { desc = "vim help" } },
	-- 			{ "m", cmd("MarksListBuf"), { desc = "marks" } },
	-- 			{ "k", cmd("Telescope keymaps") },
	-- 			{ "O", cmd("Telescope vim_options") },
	-- 			{ "r", cmd("Telescope resume") },
	-- 			{ "p", cmd("Telescope projects"), { desc = "projects" } },
	-- 			{ "/", cmd("Telescope current_buffer_fuzzy_find"), { desc = "search in file" } },
	-- 			{ "?", cmd("Telescope search_history"), { desc = "search history" } },
	-- 			{ ";", cmd("Telescope command_history"), { desc = "command-line history" } },
	-- 			{ "c", cmd("Telescope commands"), { desc = "execute command" } },
	-- 			{ "u", cmd("silent! %foldopen! | UndotreeToggle"), { desc = "undotree" } },
	-- 			{ "<Enter>", cmd("Telescope"), { exit = true, desc = "list all pickers" } },
	-- 			{ "<Esc>", nil, { exit = true, nowait = true } },
	-- 		},
	-- 	})

	Hydra({
		name = "scroll screen",
		mode = "n",
		body = "ms",
		config = {
			color = "pink",
		},
		heads = {
			{ "d", "<c-d>", { desc = "scroll down half screen" } },
			{ "u", "<c-u>", { desc = "scroll up half screen" } },
			{ "e", "<c-u>", { desc = "scroll up half screen" } },
			{ "j", "15<c-e>", { desc = "scroll down 15 lines" } },
			{ "k", "15<c-y>", { desc = "scroll up 15 lines" } },
			{ "h", cmd("BufferLineCyclePrev") },
			{ "l", cmd("BufferLineCycleNext") },
			{ "<Esc>", nil, { exit = true, nowait = true } },
		},
	})
end
