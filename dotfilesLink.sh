#!/bin/sh

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore

cp -rv .vim/plugin ~/.vim
cp -rv .vim/rc  ~/.vim
cp -v skelton.c ~/.vim
