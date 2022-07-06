local icons = require("icons")

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_cursor = true,
  respect_buf_cwd = true,
  root_dirs = { ".git" },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Information,
      warning = icons.diagnostics.Warning,
      error = icons.diagnostics.Error,
    },
  },
  git = {
    ignore = false,
  },
})
