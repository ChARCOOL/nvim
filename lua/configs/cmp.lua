local cmp = require("cmp")
local luasnip = require("luasnip")
local icons = require("icons")

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,InsertEnter",
})

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		autocomplete = {
			cmp.TriggerEvent.InsertEnter,
			cmp.TriggerEvent.TextChanged,
		},
		completeopt = "menu,menuone,noselect,noinsert",
	},
	mapping = {
		["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<c-d>"] = cmp.mapping.scroll_docs(-4),
		["<c-f>"] = cmp.mapping.scroll_docs(4),
		["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<c-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<cr>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<s-tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	formatting = {
		fields = { "abbr", "kind" },
		format = function(entry, vim_item)
			vim_item.kind = icons.kind[vim_item.kind]

			if entry.source.name == "cmp_tabnine" then
				vim_item.kind = icons.misc.Robot
				vim_item.kind_hl_group = "CmpItemKindTabnine"
			end

			if entry.source.name == "crates" then
				vim_item.kind = icons.misc.Package
				vim_item.kind_hl_group = "CmpItemKindCrate"
			end

			vim_item.menu = ({
				nvim_lsp = "",
				nvim_lua = "",
				luasnip = "",
				buffer = "",
				path = "",
			})[entry.source.name]

			return vim_item
		end,
	},
	sources = {
		{ name = "crates", group_index = 1 },
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "nvim_lua", group_index = 2 },
		{ name = "luasnip", group_index = 2 },
		{ name = "buffer", group_index = 2 },
		{ name = "cmp_tabnine", group_index = 2 },
		{ name = "path", group_index = 2 },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = "rounded",
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
		},
		completion = {
			border = "rounded",
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
		},
	},
	experimental = {
		ghost_text = true,
	},
})
