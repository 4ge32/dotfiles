#!/bin/sh

get_os_distribution() {
    if   [ -e /etc/debian_version ] ||
         [ -e /etc/debian_release ]; then
        # Check Ubuntu or Debian
        if [ -e /etc/lsb-release ]; then
            # Ubuntu
            distri_name="ubuntu"
        fi
    elif [ -e /etc/fedora-release ]; then
        # Fedra
        distri_name="fedora"
    elif [ -e /etc/gentoo-release ]; then
        # Gentoo Linux
        distri_name="gentoo"
    else
        # Other
        echo "unkown distribution"
        distri_name="unkown"
    fi

    echo ${distri_name}
}

# Get distribution and bit
get_os_info() {
   echo $(get_os_distribution)
}

ditro=`get_os_info`
if [ $ditro = "ubuntu" ]; then
  sudo apt install -y build-essential
  sudo apt install -y curl
  sudo apt install -y vim
  sudo apt install -y byobu
  sudo apt install -y global
else
  echo
fi

which htop > /dev/null 2>&1
if [ $? -eq 1 ]; then
  echo "rust has already been installed"
else
  curl https://sh.rustup.rs -sSf | sh
  cargo install rustfmt
  cargo install racer
fi

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.byobu ~/.byobu

cp -rv .vim/plugin ~/.vim
cp -rv .vim/rc  ~/.vim
cp -v .vim/skeleton.c ~/.vim
cp -v .vim/skeleton.cpp ~/.vim
cp -v .vim/skeleton.rs ~/.vim
