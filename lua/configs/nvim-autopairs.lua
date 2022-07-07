require("nvim-autopairs").setup({
	check_ts = true,
	enable_moveright = true,
	disable_filetype = {
		"TelescopePrompt",
		"vim",
	},
})

require("cmp").event:on(
	"confirm_done",
	require("nvim-autopairs.completion.cmp").on_confirm_done({
		map_char = { tex = "" },
	})
)
