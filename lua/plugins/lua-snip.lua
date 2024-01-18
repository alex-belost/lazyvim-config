return {
  "L3MON4D3/LuaSnip",
  keys = function()
    return {}
  end,
  config = function(_, opts)
    if opts then
      require("luasnip").config.setup(opts)
    end

    vim.tbl_map(function(type)
      require("luasnip.loaders.from_" .. type).lazy_load()
    end, { "vscode", "snipmate", "lua" })

    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./lua/snippets/code-spinnets" } })
    -- require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/snippets/lua-snippets" } })
  end,
}
