return {
  "nvim-pack/nvim-spectre",
  keys = {
    { "<leader>sr", false },
    {
      "<leader>R",
      function()
        require("spectre").open()
      end,
      desc = "Find and Replace (Spectre)",
    },
  },
}
