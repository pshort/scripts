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
git clone https://github.com/powerline/fonts ~/fonts

cp .vimrc ~/.vimrc
cp .bashrc ~/.bashrc
source ~/.bashrc

# install vundle plugins
vim +PluginInstall +qall

# you complete me
# cd ~/.vim/bundle/YouCompleteMe
# ./install.py

mkdir ~/.tmuxinator
cp ping.yml ~/.tmuxinator/ping.yml

#--------------------------- GIT KEYRING ------------------------
# add another comment

sudo apt-get install libgnome-keyring-dev
sudo make --directory=/usr/share/doc/git/contrib/credential/gnome-keyring
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring

#----------------------------------------------------------------

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lf "log --color --pretty=format:'%Cred%h%Creset - %Cblue%an, %ce%Creset : %Cgreen%s'"

git config --global alias.co checkout
git conifg --global alias.c commit
git config --global alias.b branch
git config --global alias.s status
git config --global alias.p push
git config --global alias.pl pull
git config --global alias.a add

sudo gem install tmuxinator

cd ~/fonts
./install.sh
cd ~/
rm ~/fonts -rf
