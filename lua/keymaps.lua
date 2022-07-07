vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function nnoremap(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true })
end

local function map(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { noremap = false, silent = true })
end

local function xnoremap(lhs, rhs)
	vim.keymap.set("x", lhs, rhs, { noremap = true, expr = true })
end

nnoremap("<leader>e", "<cmd>NvimTreeToggle<cr>")

nnoremap("<c-p>", "<cmd>Telescope find_files<cr>")
nnoremap("<c-f>", "<cmd>Telescope live_grep<cr>")
nnoremap("<c-b>", "<cmd>Telescope buffers<cr>")

nnoremap("<tab>", "<cmd>BufferLineCycleNext<cr>")
nnoremap("<s-tab>", "<cmd>BufferLineCyclePrev<cr>")

map("<leader>`", "ysiw`")
map("<leader>'", "ysiw'")
map('<leader>"', 'ysiw"')
map("<leader>(", "ysiw(")
map("<leader>[", "ysiw[")
map("<leader>{", "ysiw{")

xnoremap("p", function()
	return 'pgv"' .. vim.v.register .. "y"
end)
