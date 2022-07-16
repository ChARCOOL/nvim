vim.o.compatible = false

vim.o.breakindent = true
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.cmdheight = 2
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.fillchars = vim.o.fillchars .. "eob: "
vim.o.history = 1000
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.lazyredraw = true
vim.o.mouse = "a"
vim.o.mousefocus = true
vim.o.number = true
vim.o.pumheight = 20
vim.o.scrolloff = 3
vim.o.shiftwidth = 2
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.showtabline = 0
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swap = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 300
vim.o.wildignorecase = true
vim.o.winblend = 20
vim.o.wrap = false
vim.o.writebackup = false

vim.opt.iskeyword:append({ "-", ",", "$" })

vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
