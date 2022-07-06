local icons = require("icons")

require("lualine").setup({
  options = {
    globalstatus = true,
    disabled_filetypes = { "packer" },
  },
  sections = {
    lualine_b = {
      "branch",
      "diff",
      {
        "diagnostics",
        sources = { "nvim_lsp", "nvim_diagnostic", "vim_lsp" },
        symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
      },
    },
  },
})
