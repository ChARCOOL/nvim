vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function nnoremap(lhs, rhs)
	vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
end

local function map(lhs, rhs)
	vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = false, silent = true })
end

local function xnoremap(lhs, rhs)
	vim.keymap.set("x", lhs, rhs, { noremap = true, expr = true })
end

nnoremap("<leader>e", "<cmd>NvimTreeToggle<cr>")

nnoremap("<C-p>", "<cmd>Telescope find_files<cr>")
nnoremap("<C-f>", "<cmd>Telescope live_grep<cr>")
nnoremap("<C-b>", "<cmd>Telescope buffers<cr>")

nnoremap("<Tab>", "<cmd>BufferLineCycleNext<cr>")
nnoremap("<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")

map("<leader>`", "ysiw`")
map("<leader>'", "ysiw'")
map('<leader>"', 'ysiw"')
map("<leader>(", "ysiw(")
map("<leader>[", "ysiw[")
map("<leader>{", "ysiw{")

xnoremap("p", function()
	return 'pgv"' .. vim.v.register .. "y"
end)
