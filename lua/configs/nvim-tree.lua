local icons = require("icons")

require("nvim-tree").setup({
	respect_buf_cwd = true,
	update_cwd = true,
	hijack_cursor = true,
	view = {
		width = 30,
		side = "left",
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	filters = {
		dotfiles = false,
		custom = {
			"\\.git",
			"node_modules",
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	renderer = {
		root_folder_modifier = ":t",
		highlight_git = true,
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = icons.ui.ArrowOpen,
					arrow_closed = icons.ui.ArrowClosed,
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	-- Currently disabled because of nvim-tree issue with coc kyazdani42/nvim-tree.lua/issues/1317
	diagnostics = {
		enable = false,
		show_on_dirs = true,
		icons = {
			hint = icons.diagnostics.Hint,
			info = icons.diagnostics.Information,
			warning = icons.diagnostics.Warning,
			error = icons.diagnostics.Error,
		},
	},
})
