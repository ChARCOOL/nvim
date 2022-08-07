vim.api.nvim_create_augroup("bufcheck", {
  clear = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "bufcheck",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = "bufcheck",
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})
