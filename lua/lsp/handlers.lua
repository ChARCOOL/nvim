local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = require("cmp_nvim_lsp").update_capabilities(M.capabilities)

M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

M.setup = function()
	local icons = require("icons")

	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = false,
		severity_sort = false,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
		},
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[g", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]g", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>', opts)

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	require("illuminate").on_attach(client)
end

return M
