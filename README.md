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

## Install ripgrep

ripgrep is necessary for Telescope. Follow the steps from [here](https://github.com/BurntSushi/ripgrep) or run the following command if you are in Ubuntu.

```sh
apt install ripgrep
```

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

# How to use

Run the following command to set nvim with this configuration
```sh
mkdir $HOME/.config/nvim
git clone https://github.com/elvin-mark/init.vim $HOME/.config/nvim/
```
