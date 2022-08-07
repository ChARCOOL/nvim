local telescope = require("telescope")
local icons = require("icons")

telescope.setup({
	defaults = {
		prompt_prefix = icons.ui.Telescope .. " ",
		color_devicons = true,
		borderchars = {
			{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
		file_ignore_patterns = {
			"^./.git/",
			"^node_modules/",
			"^dist/",
			"^dest/",
			"^build/",
		},
		layout_config = {
			width = 0.70,
			height = 0.80,
			prompt_position = "top",
			horizontal = {
				width_padding = 0.10,
				height_padding = 0.12,
				preview_width = 0.5,
			},
			vertical = {
				width_padding = 0.4,
				height_padding = 0.8,
				preview_height = 0.5,
			},
			flex = {
				horizontal = {
					preview_width = 0.8,
				},
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("coc")
