# Tazvim

Tazvim is a lightweight and customizable Neovim configuration written in Lua, inspired by LazyVim. This configuration is designed to be minimal yet powerful, providing an efficient coding environment with an elegant user interface.

## Features

- **Themery**: A theme management plugin.
- **Lualine**: A customizable status line.
- **Nvim-Tree**: A file explorer tree with a and A for adding file and folder without showing full path.
- **Telescope**: A powerful fuzzy finder.
- **ToggleTerm**: Terminal management within Neovim.
- **Treesitter**: Enhanced syntax highlighting and code parsing.
- **Flash**: Improved navigation and selection.
- **Lazygit**: Git integration.
- **Treesitter-Refactor**: Code refactoring support.
- **Noice**: Improved notification management.
- **Surround**: Simple surround brackets.
- **Language Server**: Added for Golang, Python, C/C++.
- **Code Action**: Added code action.
- **Cursor Line**: Cursor under the word
- **Copilot**: Added copilot for code completion.
- **Indent Line**: Added Indent line.
- **Which key**: Added Which-Key to show keybindings with leader key.
- **Comment**: Added Comment plugin for commenting code.
- **Prettier**: Added Prettier for code formatting using Null-LS.

## Installation

1.  **Clone the repository**:

    ```
    git clone https://github.com/tahseenjamal/tazvim.git ~/.config/nvim
    ```

2.  **Run nvim**:

    ```
    nvim
    ```

### Please install dependencies of go formating, python formating, and c/c++ formating using the following commands:

1. **For Golang**:

   ```
   go get golang.org/x/tools/gopls@latest
   go get github.com/go-delve/delve/cmd/dlv@latest
   go get github.com/fatih/gomodifytags@latest
   go get github.com/cweill/gotests/gotests@latest
   go get github.com/josharian/impl@latest
   go get github.com/haya14busa/goplay/cmd/goplay@latest
   go get github.com/go-delve/delve/cmd/dlv@latest
   go get github.com/davidrjenni/reftools/cmd/fillstruct@latest
   go get github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
   go get github.com/ramya-rao-a/go-outline@latest
   go get github.com/acroca/go-symbols@latest
   go get golang.org/x/tools/cmd/guru@latest
   go get golang.org/x/tools/cmd/gorename@latest
   go get github.com/cweill/gotests/gotests@latest
   go get github.com/fatih/gomodifytags@latest
   go get github.com/josharian/impl@latest
   go get github.com/haya14busa/goplay/cmd/goplay@latest
   go get github.com/go-delve/delve/cmd/dlv@latest
   go get github.com/davidrjenni/reftools/cmd/fillstruct@latest
   go get github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
   go get github.com/ramya-rao-a/go-outline@latest
   go get github.com/acroca/go-symbols@latest
   go get golang.org/x/tools/cmd/guru@latest
   go get golang.org/x/tools/cmd/gorename@latest
   go get github.com/jstemmer/gotags@latest
   go get golang.org/x/tools/cmd/godoc@latest
   go get github.com/zmb3/gogetdoc@latest
   go get golang.org/x/lint/golint@latest
   go get github.com/fatih/motion@latest
   go get github.com/kisielk/errcheck@latest
   go get github.com/jstemmer/got
   ```

2. **For Python**:

   ```
    npm install -g pyright
   ```

3. **For C/C++**:

   ```
   sudo apt-get install clangd
   ```

4. **For Prettier**:

   ```
   npm install -g prettier
   ```

5. **For Lazygit**:
   ```
   sudo add-apt-repository ppa:lazygit-team/release
   sudo apt-get update
   sudo apt-get install lazygit
   ```

If packer.nvim is not installed, it will be automatically installed. Following that, the required plugins will be downloaded and configured. Once this process is complete, you should quit Neovim and then start it again to ensure all configurations are applied correctly.

               .___________.     ___       ________  ____    ____  __  .___  ___.
               |           |    /   \     |       /  \   \  /   / |  | |   \/   |
               `---|  |----`   /  ^  \    `---/  /    \   \/   /  |  | |  \  /  |
                   |  |       /  /_\  \      /  /      \      /   |  | |  |\/|  |
                   |  |      /  _____  \    /  /----.   \    /    |  | |  |  |  |
                   |__|     /__/     \__\  /________|    \__/     |__| |__|  |__|

## About

I have been using VIM from a very long time and didn't want to migrate to another editor with a lot of change in the keymaps. So I put together a very simple setup that can be easily used by anyone who is new to NeoVim configuration or is someone who is trying to switch from VIM to NeoVim. This setup is very minimal and has only the necessary plugins that are required for a good coding experience.

## License

This project is licensed under the MIT License.
