return {
  disable_commands = false,
  debug = false,
  server = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    flags = { debounce_text_changes = 300 },
    root_dir = vim.loop.cwd,
  },
}
