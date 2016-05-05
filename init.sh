YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

if [[ ! -z $YUM_CMD]]; then

    sudo yum update -y

    sudo yum install git -y
    sudo yum install vim -y
    sudo yum install tmux -y

elif [[ ! -z $APT_GET_CMD]]; then

    sudo apt-get update -y
    sudo apt-get upgrade -y

    sudo apt-get install git -y
    sudo apt-get install vim -y
    sudo apt-get install tmux -y
fi

git config --global user.email "peter.short@gmail.com"
git config --global user.name "Peter Short"
git config --global core.editor "vim"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp .vimrc ~/.vimrc
cp .bashrc ~/.bashrc
source ~/.bashrc
