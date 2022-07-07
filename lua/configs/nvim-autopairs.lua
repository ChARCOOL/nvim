require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	check_ts = true,
})

require("cmp").event:on(
	"confirm_done",
	require("nvim-autopairs.completion.cmp").on_confirm_done({
		map_char = { tex = "" },
	})
)
