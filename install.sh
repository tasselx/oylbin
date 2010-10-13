#!/bin/sh

SCRIPT=`readlink -f $0`
SCRIPTPATH=`dirname $SCRIPT`

rm -rf ~/.vimrc
ln -s $SCRIPTPATH/vimrc ~/.vimrc

rm -rf ~/.vim
ln -s $SCRIPTPATH/vim ~/.vim

rm -rf ~/.screenrc
ln -s $SCRIPTPATH/screenrc ~/.screenrc

if [ ! -L ~/.bashrc ]; then
    echo ". $SCRIPTPATH/bashrc" >> ~/.bashrc
else
    rm -rf ~/.bashrc
    ln -s $SCRIPTPATH/bashrc ~/.bashrc
fi
