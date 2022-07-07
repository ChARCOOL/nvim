local luasnip = require("luasnip")

luasnip.config.set_config({
	update_events = "TextChanged,TextChangedI",
})

_G.tab_complete = function()
	if luasnip and luasnip.expand_or_jumpable() then
		return vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true)
	else
		return vim.api.nvim_replace_termcodes("<tab>", true, true, true)
	end
end

vim.keymap.set({ "i", "s" }, "<tab>", "v:lua.tab_complete()", { expr = true })

_G.shift_tab_jump = function()
	if luasnip.jumpable(-1) then
		return vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true)
	else
		return vim.api.nvim_replace_termcodes("<s-tab>", true, true, true)
	end
end

vim.keymap.set({ "i", "s" }, "<s-tab>", "v:lua.shift_tab_jump()", { expr = true })
