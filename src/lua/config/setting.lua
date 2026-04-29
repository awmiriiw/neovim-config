local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.number = true
opt.relativenumber = false
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.completeopt = { "menu", "menuone", "noselect" }

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "gl", vim.diagnostic.open_float, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)
