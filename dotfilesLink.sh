#!/bin/sh
sudo apt install -y build-essential 
sudo apt install -y curl
sudo apt install -y vim
sudo apt install -y byobu

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
