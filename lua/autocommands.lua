vim.api.nvim_create_augroup("bufcheck", {
	clear = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "bufcheck",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "bufcheck",
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufReadPost" }, {
	group = "bufcheck",
	pattern = "*",
	callback = function()
		local row, column = unpack(vim.api.nvim_buf_get_mark(0, '"'))
		local buf_line_count = vim.api.nvim_buf_line_count(0)

		if row >= 1 and row <= buf_line_count then
			vim.api.nvim_win_set_cursor(0, { row, column })
		end
	end,
})
