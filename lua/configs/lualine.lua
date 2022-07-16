local icons = require("icons")

require("lualine").setup({
	options = {
		theme = "tokyonight",
		globalstatus = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return "<" .. str:sub(1, 1) .. ">"
				end,
			},
		},
		lualine_b = {
			{
				"branch",
				icon = "",
				separator = { right = "" },
			},
		},
		lualine_c = {
			"%=",
			{ "filetype", icon_only = true },
			{ "filename", path = 1, color = "LualineFileName" },
		},
		lualine_x = {
			{
				"diagnostics",
				sources = {
					"nvim_diagnostic",
					"coc",
				},
				symbols = {
					error = icons.diagnostics.Error .. " ",
					warn = icons.diagnostics.Warning .. " ",
				},
				update_in_insert = false,
			},
			{ "filesize", color = "LualineFileSize" },
			{ "filetype", color = "LualineFileType" },
		},
		lualine_y = { { "progress" } },
		lualine_z = { { "location" } },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 0 } },
		lualine_x = { "filetype" },
		lualine_z = { "location" },
	},
	extensions = {
		"man",
		"nvim-tree",
	},
})
