#!/bin/bash

#####
# setup my shell environment
#####

# copy my customized file
cp -r .bash ~/ 

# installing powerline-shell
cd ~/ 
git clone https://github.com/milkbikis/powerline-shell
cd powerline-shell
cp config.py.dist config.py
# enable term title
sed -i "s/#\ \ \ \ 'set_term_title'/\ \ \ \ 'set_term_title'/g" config.py
# disable username
sed -i "s/'username'/#'username'/g" config.py
# disable ssh padlock
sed -i "s/'ssh'/#'ssh'/g" config.py

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
