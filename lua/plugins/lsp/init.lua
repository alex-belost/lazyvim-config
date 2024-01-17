return {
  "neovim/nvim-lspconfig",
  opts = {
    format = require("plugins.lsp.format"),
    servers = require("plugins.lsp.servers"),
    setup = require("plugins.lsp.setup"),
  },
}
