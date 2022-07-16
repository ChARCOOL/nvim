require("nvim-autopairs").setup({
	check_ts = true,
	map_cr = false,
	enable_moveright = true,
	disable_filetype = {
		"TelescopePrompt",
		"vim",
	},
})

_G.MUtils = {}

MUtils.completion_confirm = function()
	if vim.fn.pumvisible() ~= 0 then
		return vim.fn["coc#_select_confirm"]()
	end

	return require("nvim-autopairs").autopairs_cr()
end

vim.api.nvim_set_keymap("i", "<cr>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
