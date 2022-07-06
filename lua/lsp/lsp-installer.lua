local servers = {
  "cssls",
  "cssmodules_ls",
  "emmet_ls",
  "html",
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "yamlls",
  "bashls",
  "rust_analyzer",
}

require("nvim-lsp-installer").setup({
  ensure_installed = servers,
  ui = {
    icons = {},
    keymaps = {
      toggle_server_expand = "<cr>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
    },
  },
  log_level = vim.log.levels.INFO,
})

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    flags = { debounce_text_changes = 300 },
    root_dir = vim.loop.cwd,
  }

  if server == "jsonls" then
    local jsonls_opts = require("lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require("lsp.settings.yamlls")
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  if server == "sumneko_lua" then
    local sumneko_opts = require("lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require("lsp.settings.emmet_ls")
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  if server == "tsserver" then
    local tsserver_opts = require("lsp.settings.tsserver")

    require("typescript").setup(tsserver_opts)
    goto continue
  end

  if server == "rust_analyzer" then
    local rust_analyzer_opts = require("lsp.settings.rust_analyzer")

    require("rust-tools").setup(rust_analyzer_opts)
    goto continue
  end

  require("lspconfig")[server].setup(opts)
  ::continue::
end
