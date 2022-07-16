local telescope = require("telescope")
local icons = require("icons")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--hidden",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		},
		prompt_prefix = icons.ui.Telescope .. " ",
		selection_strategy = "reset",
		scroll_strategy = "cycle",
		color_devicons = true,
		dynamic_preview_title = true,
		path_display = {
			"absolute",
		},
		history = {
			path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
		},
		set_env = {
			["COLORTERM"] = "truecolor",
		},
		borderchars = {
			{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
		file_ignore_patterns = {
			"%.git/",
			"node_modules/",
			"dest/",
			"dist/",
			"build/",
		},
		layout_config = {
			width = 0.90,
			height = 0.90,
			prompt_position = "top",
			horizontal = {
				width_padding = 0.11,
				height_padding = 0.13,
				preview_width = 0.56,
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
	pickers = {
		live_grep = {
			file_ignore_patterns = {
				".git/",
			},
		},
		colorscheme = {
			enable_preview = true,
		},
		find_files = {
			find_command = {
				"fd",
				"--type",
				"f",
				"--strip-cwd-prefix",
			},
			hidden = true,
		},
		git_bcommits = {
			layout_config = {
				horizontal = {
					preview_width = 0.55,
				},
			},
		},
		git_commits = {
			layout_config = {
				horizontal = {
					preview_width = 0.55,
				},
			},
		},
	},
})

telescope.load_extension("fzf")
