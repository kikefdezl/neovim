# My Neovim 
![Screenshot](assets/screenshot.png)

# Installation

### 1. Install Neovim >= 0.10

Ubuntu: 

Install from [Tarball](https://github.com/neovim/neovim/releases/tag/stable)

```bash
wget ...  #  Download the latest `linux64.tar.gz`
sudo tar xzvf nvim-linux64.tar.gz -C /opt
sudo cp /opt/nvim-linux64/bin/nvim /usr/bin/ -s
```

Arch:

```bash
sudo pacman -S neovim
```

### 2. Install other requirements

#### 2.1. JetBrainsMono Nerd font

```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts/
rm JetBrainsMono.zip
```

#### 2.2. System Clipboard utility

Required for yanking text in NeoVim to system clipboard

- On X, install `xclip`
- On Wayland, install `wl-clipboard`


### 3. Install Custom Config

(Optional) Remove previous configurations
```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

Install:
```bash
git clone git@github.com:kikefdezl/neovim.git ~/.config/nvim
nvim
```
