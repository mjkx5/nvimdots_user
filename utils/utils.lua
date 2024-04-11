local M = {}

function M.print()
	vim.cmd(":let @m = yy")
	return 'vim.cmd("echo @m")'
	-- return 'vim.cmd("' .. "@m" .. '")'
end

function M.copy_content()
	return [[:let @m = '{} ' .. expand("<cword>") .. '() [' .. expand("%:p:.") .. ']'<cr><c-w>l]]
end

function M.filename()
	return 'expand("%:p:.")'
end
return M
