return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        integrations = {
          telescope = true,
          cmp = true,
          gitsigns = true,
          lualine = true,
          nvimtree = true,
          treesitter = true,
          which_key = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },
}
