vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function nnoremap(lhs, rhs)
	vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
end

local function nmap(lhs, rhs)
	vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = false, silent = true })
end

local function xnoremap(lhs, rhs)
	vim.api.nvim_set_keymap("x", lhs, rhs, { noremap = true, silent = true })
end

nnoremap("<leader>e", ":<C-u>NvimTreeToggle<CR>")

nnoremap("<C-p>", ":<C-u>Telescope find_files<CR>")
nnoremap("<C-f>", ":<C-u>Telescope live_grep<CR>")
nnoremap("<C-b>", ":<C-u>Telescope buffers<CR>")

nnoremap("<leader>d", ":<C-u>:Telescope coc diagnostics<CR>")
nnoremap("<leader>s", ":<C-u>:Telescope coc document_symbols<CR>")

nnoremap("<Tab>", ":<C-u>BufferLineCycleNext<CR>")
nnoremap("<S-Tab>", ":<C-u>BufferLineCyclePrev<CR>")

nmap("<leader>`", "ysiw`")
nmap("<leader>'", "ysiw'")
nmap('<leader>"', 'ysiw"')
nmap("<leader>(", "ysiw(")
nmap("<leader>[", "ysiw[")
nmap("<leader>{", "ysiw{")

xnoremap("p", "pgvy")
