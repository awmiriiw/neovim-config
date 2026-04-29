return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 32,
        },
        renderer = {
          group_empty = true,
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        actions = {
          open_file = {
            quit_on_open = false,
          },
        },
      })

      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle file explorer",
      })

      vim.keymap.set("n", "<leader>b", function()
        local api = require("nvim-tree.api")
        if vim.bo.filetype == "NvimTree" then
          vim.cmd("wincmd p")
        else
          api.tree.focus()
        end
      end, {
        noremap = true,
        silent = true,
        desc = "Focus explorer",
      })
    end,
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      local bufferline = require("bufferline")

      bufferline.setup({
        options = {
          diagnostics = "nvim_lsp",
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
        },
      })

      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>",
        { noremap = true, silent = true, desc = "Next buffer" })
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>",
        { noremap = true, silent = true, desc = "previous buffer" })

      local function smart_buf_close()
        local current = vim.api.nvim_get_current_buf()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })

        if #buffers > 1 then
          local ok = pcall(bufferline.cycle, 1)
          if not ok then
            bufferline.cycle(-1)
          end
          vim.cmd("bdelete " .. current)
        else
          vim.cmd("bdelete")
        end
      end

      vim.keymap.set("n", "<leader>w", smart_buf_close, { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>t", require("utils.terminal").smart_toggle_terminal, { noremap = true, silent = true })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          globalstatus = true,
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {},
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "",
        "  ███╗   ██╗███████╗██╗   ██╗██╗███╗   ███╗",
        "  ████╗  ██║██╔════╝██║   ██║██║████╗ ████║",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║██╔████╔██║",
        "  ██║╚██╗██║██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║",
        "  ██║ ╚████║███████╗  ╚████╔╝ ██║██║ ╚═╝ ██║",
        "  ╚═╝  ╚═══╝╚══════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
      }

      dashboard.section.buttons.val = {
        dashboard.button(",", "Leader", "<cmd>lua require('which-key').show('')<CR>"),
        dashboard.button("e", "New file", ":enew<CR>"),
        dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
        dashboard.button("g", "Live grep", ":Telescope live_grep<CR>"),
        dashboard.button("r", "Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.config)
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },
}
