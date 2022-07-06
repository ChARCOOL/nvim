local telescope = require("telescope")
local icons = require("icons")

telescope.setup({
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    file_ignore_patterns = {
      "%.git/",
      "node_modules/",
      "dest/",
      "dist/",
      "build/",
    },
  },
})

telescope.load_extension("fzf")
