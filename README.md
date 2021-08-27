# Configuration Files to my Dev workflow with Node.js

Hello!

Welcome to my repository of configuration files to Linux Systems!

Nowadays, I'm using Linux, more specific Zorion Core 16. I'm migrated from Pop! OS 20.04 recently because I'm not shure about the future of COSMIC. Sincerely, I'm fell confused.

So, if you want to use my configuration files, I'm recomend you to use some linux distro based on Ubuntu 20.04+. If you use other Linux distro, be shure you installing Vim version 8+ or NeoVim 0.4.4+.

# Setup the tools

### Installing git and curl
```sh
sudo apt update && sudo apt install git curl -y 
```

### Installing Node Version Manager (nvm)
```sh
# Dowload and Install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Include variables to PATH
echo -e 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.bashrc

# Reload .bashrc with variables
source ~/.bashrc

# Install the last LTS version of Node.js
nvm install --lts

#Alternativelly, install Yarn
npm install --global yarn
```

### So now, how you can configure Vim?
Whichever is, Vim or Neovim, both are great tools, which do basic the same thing. 


### Installing and configuring Vim :)
```sh
# Install Vim with apt
sudo apt update && sudo apt install vim -y

# Installing vim-plug plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Backup your .vimrc file 
cp ~/.vimrc ~/.vimrcbkp

# Download the configuration file    
curl https://raw.githubusercontent.com/cezarmzz/dotfiles/main/.vimrc > ~/.vimrc
```


### Or Installing NeoVim
```sh
# Installing NeoVim
sudo apt update && sudo apt install neovim -y 

# Installing vim-plug plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
# Backup your nvim folder file 
cp -R ~/.config/nvim ~/.config/nvim_bkp

# Download configuration files    
sh -c 'curl -fLo ~/.config/nvim/init.vim --create-dirs \
	https://raw.githubusercontent.com/cezarmzz/dotfiles/40c3989bee6e5c9198895f6595e2f2b6b6b38f47/.config/nvim/init.vim'
sh -c 'curl -fLo ~/.config/nvim/coc-settings.json --create-dirs \
	https://raw.githubusercontent.com/cezarmzz/dotfiles/40c3989bee6e5c9198895f6595e2f2b6b6b38f47/.config/nvim/coc-settings.json'
```

So now, open vim with command ```vim``` and type ```:PlugInstall``` and wait all plugins end up the installation.

Close vim and open again. If everything has installed, you now ready to start your development with Node.js and Vim :)

Please, if you enjoy, pick a star to this repo!
