return {
  "LuaSnip",
  config = function(_, opts)
    if opts then
      require("luasnip").config.setup(opts)
    end

    vim.tbl_map(function(type)
      require("luasnip.loaders.from_" .. type).lazy_load()
    end, { "vscode", "snipmate", "lua" })

    vim.tbl_map(function(type)
      require("luasnip.loaders.from_" .. type).lazy_load({
        paths = { vim.fn.stdpath("config") .. "/snippets/" .. type },
      })
    end, { "vscode" })
  end,
}
