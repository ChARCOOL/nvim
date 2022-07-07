local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

vim.opt.shortmess:append("c")

cmp.setup({
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	mapping = {
		["<up>"] = cmp.mapping.scroll_docs(-4),
		["<down>"] = cmp.mapping.scroll_docs(4),
		["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<cr>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<esc>"] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.close()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-c>", true, true, true), "n", true)
				end
			end,
		}),
		["<tab>"] = cmp.mapping(
			cmp.mapping.select_next_item({
				behavior = cmp.SelectBehavior.Select,
			}),
			{ "i", "c" }
		),
		["<s-tab>"] = cmp.mapping(
			cmp.mapping.select_prev_item({
				behavior = cmp.SelectBehavior.Select,
			}),
			{ "i", "c" }
		),
	},
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "emoji" },
	}, {
		{ name = "buffer" },
	}),
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find("^_+")
				local _, entry2_under = entry2.completion_item.label:find("^_+")
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[BUF]",
				cmdline = "[CMD]",
				cmp_git = "[GIT]",
				cmp_tabnine = "[TBN]",
				copilot = "[COP]",
				emoji = "[EMJ]",
				luasnip = "[SNIP]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[API]",
				path = "[PATH]",
				spell = "[SPELL]",
				treesitter = "[TREE]",
			},
		}),
	},
	experimental = {
		ghost_text = true,
	},
})

local search_sources = {
	sources = cmp.config.sources({
		{
			name = "buffer",
			options = { keyword_pattern = [=[[^[:blank:]].*]=] },
		},
	}),
}

cmp.setup.cmdline("/", search_sources)

cmp.setup.cmdline("?", search_sources)

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})
