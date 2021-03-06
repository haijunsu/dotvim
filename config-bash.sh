#!/bin/bash

#####
# setup my shell environment
#####

# copy my customized file
cp -r .bash ~/

# fix font italic in terminal issue

{ infocmp -1 xterm-256color ; echo -e "\tsitm=\\E[3m,\n\tritm=\\E[23m,"; } > xterm-256color.terminfo
tic xterm-256color.terminfo
rm xterm-256color.terminfo

# tmux config
cp tmux.conf ~/.tmux.conf

# installing powerline-shell
SED=$(which sed)
if [ -f /usr/local/bin/gsed ]; then
    # This script only support gnu sed
    SED='/usr/local/bin/gsed'
fi
cd ~/
git clone https://github.com/milkbikis/powerline-shell
cd powerline-shell
cp config.py.dist config.py
# enable term title
#gsed -i "s/#\ \ \ \ 'set_term_title'/\ \ \ \ 'set_term_title'/g" config.py
${SED} -i "s/#\ \ \ \ 'set_term_title'/\ \ \ \ 'set_term_title'/g" config.py
# disable username
# gsed -i "s/'username'/#'username'/g" config.py
${SED} -i "s/'username'/#'username'/g" config.py
# disable ssh padlock
gsed -i "s/'ssh'/#'ssh'/g" config.py
${SED} -i "s/'ssh'/#'ssh'/g" config.py

./install.py
cd ~/
ln -s ~/powerline-shell/powerline-shell.py

# modify .bashrc
grep "powerline-shell" ~/.bashrc >/dev/null 2>&1
rc=$?
if [[ $rc != 0 ]]; then
   echo "# enable powerline-shell">> ~/.bashrc
   echo ". ~/.bash/powerline-shell.sh">> ~/.bashrc
else
    echo "Powerline-shell has already enabled"
fi
# source myenv
grep "myenv" ~/.bashrc >/dev/null 2>&1
rc=$?
if [[ $rc != 0 ]]; then
   echo "# enable myenv">> ~/.bashrc
   echo ". ~/.bash/myenv">> ~/.bashrc
else
    echo "myenv has already enabled"
fi

echo "Done."
