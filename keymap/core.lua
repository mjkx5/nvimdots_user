local bind = require("keymap.bind")
local utils = require("utils.utils")
local map_cmd = bind.map_cmd
local map_cr = bind.map_cr

return {
	["n|;"] = map_cmd(":"):with_noremap():with_desc("change ; into :"),
	["n|<leader>mn"] = map_cr("set nu"):with_desc("show line number"),
	["n|<leader>me"] = map_cmd(":e %:p:h/"):with_noremap():with_desc("edit current directory files"),
	["n|<leader>mf"] = map_cr('echo expand("%:p")'):with_desc("show file name"),
	["n|<leader>mo"] = map_cmd(":vs $NOTE/"):with_noremap():with_desc("open the note file"),
	["n|<leader>mm"] = map_cmd(utils.copy_content()):with_noremap():with_desc("copy file path + name into m register"),

	["n|<leader>mp"] = map_cmd('o<esc>"mp^'):with_noremap():with_desc("paste m register to current window"),
	["n|<leader>ns"] = map_cmd("a {s} "):with_noremap():with_desc("print struct"),
	["n|<leader>ni"] = map_cmd("a {i} "):with_noremap():with_desc("print interface"),
	["n|mm"] = map_cmd("zt"):with_desc("Redraw, line [count] at top of window"),
	["n|mn"] = map_cmd("zb"):with_desc("Redraw, line [count] at top of window"),
	["n|ml"] = map_cr("!rustrover %<cr>"):with_desc("open window in rustRover"),
	["t|<c-cr>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.

	-- python replace log
	-- ["n|ml"] = map_cmd(
	-- [[:%s/\(print\)("\(.*\)")/\=printf('%s("%s , file: %s, line: %s")', submatch(1), submatch(2), expand("%:p"), line("."))/g<cr>]]
	-- ),
	--	rust place log
	-- ["n|ml"] = map_cmd(
	-- 	[[:%s/\(info!\)("\(.*\)")/\=printf('%s("%s , file: %s, line: %s")', submatch(1), submatch(2), expand("%:p"), line("."))/g<cr>]]
	-- ),
}
