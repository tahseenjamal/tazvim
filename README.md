            .___________.     ___       ________  ____    ____  __  .___  ___.
            |           |    /   \     |       /  \   \  /   / |  | |   \/   |
            `---|  |----`   /  ^  \    `---/  /    \   \/   /  |  | |  \  /  |
                |  |       /  /_\  \      /  /      \      /   |  | |  |\/|  |
                |  |      /  _____  \    /  /----.   \    /    |  | |  |  |  |
                |__|     /__/     \__\  /________|    \__/     |__| |__|  |__|

TazVim is a lightweight and customizable Neovim configuration, inspired by LazyVim. This configuration is designed to be minimal yet powerful, providing an efficient coding environment with an elegant user interface.

## Prerequisites

You should have neovim installed on your system along with git, npm, python3, C/C++ compiler, and Rust compiler.

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
- **Language Server**: Added for Golang, Python, C/C++, Rust.
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

1.  **For Golang**:
    ```
    go get github.com/acroca/go-symbols@latest
    go get github.com/cweill/gotests/gotests@latest
    go get github.com/davidrjenni/reftools/cmd/fillstruct@latest
    go get github.com/fatih/gomodifytags@latest
    go get github.com/fatih/motion@latest
    go get github.com/go-delve/delve/cmd/dlv@latest
    go get github.com/haya14busa/goplay/cmd/goplay@latest
    go get github.com/josharian/impl@latest
    go get github.com/jstemmer/got
    go get github.com/jstemmer/gotags@latest
    go get github.com/kisielk/errcheck@latest
    go get github.com/ramya-rao-a/go-outline@latest
    go get github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
    go get github.com/zmb3/gogetdoc@latest
    go get golang.org/x/lint/golint@latest
    go get golang.org/x/tools/cmd/godoc@latest
    go get golang.org/x/tools/cmd/gorename@latest
    go get golang.org/x/tools/cmd/gorename@latest
    go get golang.org/x/tools/cmd/guru@latest
    go get golang.org/x/tools/cmd/guru@latest
    go get golang.org/x/tools/gopls@latest
    ```

2.  **For Python**:

    ```
     npm install -g pyright
    ```

3.  **For C/C++**:

    For Linux you can use below

    ```
    sudo apt-get install clangd
    ```

    For Mac you can use below

    ```
    brew install clangd
    ```

4.  **For Rust**:

    Install rust-init and then do standard installation, which would install all the required tools. Once done, run below command.

    ```
    rustup component add rust-analyzer
    ```

5.  **For Prettier**:

    ```
    npm install -g prettier
    ```

6.  **For Lazygit**:

    For Linux you can use below

        ```
        sudo add-apt-repository ppa:lazygit-team/release
        sudo apt-get update
        sudo apt-get install lazygit
        ```

    For Mac you can use below

        ````
        brew install lazygit
        ```

## About

Having used VIM for a long time, I wanted to maintain a familiar feel while transitioning to a new editor. To achieve this, I created a straightforward NeoVim setup that’s ideal for both newcomers to NeoVim and those switching from VIM. This minimal configuration includes only the essential plugins, ensuring a smooth and efficient coding experience without unnecessary complexity.

## License

This project is licensed under the MIT License.

```

```
