return {
  "folke/noice.nvim",
  keys = {
    { "<leader>snl", false },
    { "<leader>snh", false },
    { "<leader>sna", false },
    { "<leader>snd", false },

    {
      "<leader>fnl",
      function()
        require("noice").cmd("last")
      end,
      desc = "Noice Last Message",
    },
    {
      "<leader>fnh",
      function()
        require("noice").cmd("history")
      end,
      desc = "Noice History",
    },
    {
      "<leader>fna",
      function()
        require("noice").cmd("all")
      end,
      desc = "Noice All",
    },
    {
      "<leader>fnd",
      function()
        require("noice").cmd("dismiss")
      end,
      desc = "Dismiss All",
    },
  },
}

