return {
  "nvim-cmp",

  dependencies = {
    { "rafamadriz/friendly-snippets" },
    { "garymjr/nvim-snippets", opts = { friendly_snippets = true } },
  },
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()

    opts.snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    }

    table.insert(opts.sources, { name = "snippets" })

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim-snippets" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
}

-- return {
--   "nvim-cmp",
--   dependencies = {
--     { "rafamadriz/friendly-snippets" },
--     { "garymjr/nvim-snippets", opts = { friendly_snippets = true } },
--   },
--   opts = function(_, opts)
--     opts.snippet = {
--       expand = function(item)
--         return lazyvim.cmp.expand(item.body)
--       end,
--     }
--     table.insert(opts.sources, { name = "snippets" })
--   end,
--   keys = {
--     {
--       "<tab>",
--       function()
--         return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<tab>"
--       end,
--       expr = true,
--       silent = true,
--       mode = { "i", "s" },
--     },
--     {
--       "<s-tab>",
--       function()
--         return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<tab>"
--       end,
--       expr = true,
--       silent = true,
--       mode = { "i", "s" },
--     },
--   },
-- }
