# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

export EDITOR=/usr/bin/vim
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.dotnet/tools:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/home/peter/.cache/rebar3/bin:$PATH

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

alias ls='ls -all --color=auto'
alias grep='grep --color=auto'

#
. "$HOME/.cargo/env"
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
