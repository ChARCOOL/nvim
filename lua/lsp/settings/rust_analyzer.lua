return {
  tools = {
    inlay_hints = {
      parameter_hints_prefix = " ",
      other_hints_prefix = " ",
    },
    hover_actions = {
      auto_focus = false,
      border = "rounded",
    },
  },
  server = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    settings = {
      ["rust-analyzer"] = {
        lens = { enable = true },
        checkOnSave = { command = "clippy" },
      },
    },
  },
}
