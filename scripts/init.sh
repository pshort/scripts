#!bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install git -y
sudo apt-get install vim -y
sudo apt-get install tmux -y

git config --global user.email "peter.short@gmail.com"
git config --global user.name "Peter Short"
git config --global core.editor "vim"

git clone https://github.com/Vundle.vim.git ~/.vim/bundle/Vundle.vim


