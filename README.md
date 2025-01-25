# init.vim

# Prerequisites

## Install vim-plug

Follow the steps [here](https://github.com/junegunn/vim-plug) to install vim-plug according to your operative system.

## Install fonts

Download a font from [here](https://www.nerdfonts.com/font-downloads). Preferrably, you can download the fonts from jetbrains.

```sh
mkdir -p ~/.local/share/fonts
mv path/to/font/*.ttf ~/.local/share/fonts
```

```sh
fc-cache -fv
```

## Install code-minimap

Install (minimap)[https://github.com/wfxr/code-minimap] from one of the binaries that suits your environment

## Install LSP

### Python

```sh
npm install -g pyright
```

```sh
pip install black
```

### C

```sh
sudo apt install clangd
sudo apt install clang-format clang-tidy
```

## Install Lazy Git

Install lazygit tool from [here](https://github.com/jesseduffield/lazygit)
