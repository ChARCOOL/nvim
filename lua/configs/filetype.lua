require("filetype").setup({
	overrides = {
		literal = {
			["kitty.conf"] = "kitty",
			[".gitignore"] = "conf",
			["env"] = "sh",
			["gitconfig"] = "gitconfig",
			[".luacheckrc"] = "lua",
			["vimrc"] = "vim",
		},
		shebang = {
			dash = "sh",
		},
	},
})
