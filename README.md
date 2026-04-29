# Neovim-Config

A modern, fast, and functional Neovim setup built from scratch in Lua. This configuration aims to provide a lightweight, IDE-like experience with a focus on modularity and simplicity.

## 🔎 About

The goal of this configuration is to create a powerful development environment using the speed and flexibility of Neovim. All plugins are managed by `lazy.nvim` to ensure fast startup times and optimal performance. The file structure is organized by feature, with each core functionality (completion, formatting, UI, etc.) isolated in its own file for easy management and customization.

This setup is fine-tuned for web development (JavaScript, TypeScript, HTML, CSS) and systems programming (C, C++, Python, Bash) and etc.

## 🛠️ Features

- **Fast Plugin Management**: Uses `lazy.nvim` for lightning-fast, declarative plugin management.
- **Beautiful & Functional UI**:
  - Gorgeous **Catppuccin (Mocha)** theme.
  - A powerful statusline powered by **Lualine**.
  - Tab-like buffer navigation with **Bufferline**.
  - A clean file explorer with **Nvim-Tree**.
  - Clear indentation guides with **indent-blankline**.
  - A welcoming dashboard with **alpha-nvim**.
- **Intelligent Code Completion**: Advanced autocompletion with **nvim-cmp**, supporting LSP, snippets (`LuaSnip`), and buffer sources.
- **Full LSP Support**: Seamless integration with Language Servers via **nvim-lspconfig** and automatic LSP installer management with **mason.nvim**.
- **Auto-Formatting**: Code is automatically formatted on save using **conform.nvim**, with support for numerous languages.
- **Git Integration**: See Git diffs and status indicators directly in the sign column with **gitsigns.nvim**.
- **Core Tools**:
  - Powerful fuzzy finding capabilities with **Telescope**.
  - A built-in, toggleable terminal with **toggleterm.nvim**.
  - Effortless code commenting with **Comment.nvim**.
  - A helpful keybinding guide with **which-key.nvim**.
- **Modular Structure**: Every part of the configuration is broken down into logical files, making it easy to maintain and extend.

## 📂 Project Structure

The configuration is organized modularly for high readability and maintainability.

```
.
├── init.lua
└── lua
    ├── config
    │   └── setting.lua
    ├── plugins
    │   ├── completion.lua
    │   ├── formatting.lua
    │   ├── foundation.lua
    │   ├── git.lua
    │   ├── lsp.lua
    │   ├── theme.lua
    │   └── ui.lua
    └── utils
        └── terminal.lua
```

## 🚀 Getting Started

Follow these instructions to get this configuration up and running on your system.

### Prerequisites

Before you begin, ensure you have the following installed:

- **Neovim**: Version `0.8` or higher.
- **Git**: For cloning the repository and managing plugins.
- **A Nerd Font**: Required for icons in Lualine, Nvim-Tree, etc. [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) is a great choice.
- **Build Tools**: A C compiler like `gcc` and `make` are needed for some plugins.
- **Formatters**: To use auto-formatting, you must install the respective command-line tools.

  ```bash
  # Example for installing some formatters
  # Lua
  luarocks install stylua
  # Python
  pip install black
  # Web (JavaScript, TypeScript, HTML, CSS, JSON)
  npm install -g prettierd
  ```

  ```bash
  # For ArchLinux/Arch-based systems
  # C/C++
  sudo pacman -S clang
  # Shell
  sudo pacman -S shfmt
  ```

  ```bash
  # For ubuntu/debian-based systems
  # C/C++
  sudo apt install clang-format
  # Shell
  sudo apt install shfmt
  ```

> **Note**: `mason.nvim` will automatically install LSP servers, but formatters must be installed separately on your system.

### Installation

1.  **Back up your existing Neovim configuration (Important):**

    ```bash
    # Rename your existing nvim directory, if it exists
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

2.  **Clone this repository to `~/.config/nvim`:**

    ```bash
    git clone "https://github.com/awmiriiw/neovim-config.git" ~/.config/nvim
    ```

3.  **Launch Neovim:**

    ```bash
    nvim
    ```

    `lazy.nvim` will automatically start, installing all the required plugins. After the installation is complete, restart Neovim, and you're good to go\!

## 📝 License

This project is open-source and available under the [MIT License](https://opensource.org/license/mit).

**Thanks for visiting! ☕**
