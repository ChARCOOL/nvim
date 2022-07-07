require("bufferline").setup({
	options = {
		numbers = "none",
		separator_style = "thick",
		show_close_icon = false,
		show_buffer_close_icons = false,
		offsets = {
			{
				filetype = "undotree",
				text = "Undotree",
				highlight = "PanelHeading",
				padding = 1,
			},
			{
				filetype = "NvimTree",
				text = "Explorer",
				highlight = "PanelHeading",
				padding = 1,
			},
			{
				filetype = "DiffviewFiles",
				text = "Diff View",
				highlight = "PanelHeading",
				padding = 1,
			},
			{
				filetype = "flutterToolsOutline",
				text = "Flutter Outline",
				highlight = "PanelHeading",
			},
			{
				filetype = "packer",
				text = "Packer",
				highlight = "PanelHeading",
				padding = 1,
			},
		},
	},
})
