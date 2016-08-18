YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

if [[ ! -z $YUM_CMD ]]; then

    sudo yum update -y

    sudo yum install git -y
    sudo yum install vim -y
    sudo yum install tmux -y
    sudo yum install rubygems -y

elif [[ ! -z $APT_GET_CMD ]]; then

    sudo apt-get update -y
    sudo apt-get upgrade -y

    sudo apt-get install git -y
    sudo apt-get install vim -y
    sudo apt-get install tmux -y
    sudo apt-get install rubygems -y
else
    echo "Cant find a package manager :("
    exit 1;
fi

git config --global user.email "peter.short@gmail.com"
git config --global user.name "Peter Short"
git config --global core.editor "vim"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp .vimrc ~/.vimrc
cp .bashrc ~/.bashrc
source ~/.bashrc

# install vundle plugins
vim +PluginInstall +qall

# you complete me
cd ~/.vim/bundle/YouCompleteMe
./install.py

mkdir ~/.tmuxinator
cp ping.yml ~/.tmuxinator/ping.yml

#--------------------------- GIT KEYRING ------------------------

sudo apt-get install libgnome-keyring-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring

#----------------------------------------------------------------

sudo gem install tmuxinator
