#!/bin/sh

cd $(dirname $0)

rm -rf ~/.vimrc
ln -s vimrc ~/.vimrc

rm -rf ~/.vim
ln -s vim ~/.vim

rm -rf ~/.screenrc
ln -s screenrc ~/.screenrc

if [ -f ~/.bashrc ]; then
    cat bashrc >> ~/.bashrc
else
    ln -s bashrc ~/.bashrc
fi
