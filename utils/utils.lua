local M = {}

function M.print()
	vim.cmd(":let @m = yy")
	return 'vim.cmd("echo @m")'
	-- return 'vim.cmd("' .. "@m" .. '")'
end

function M.copy_content()
	local content = {
		-- "'let @m = '",
		" '{} '",
		' .. expand("<cword>")',
		" .. '() [' ",
		' .. expand("%:p:.") ',
		" .. ']' ",
	}
	return table.concat(content)
	-- return 'expand("<cword>")' + "() "
end

function M.filename()
	return 'expand("%:p:.")'
end
return M
