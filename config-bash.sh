#!/bin/bash

#####
# setup my shell environment
#####

# copy my customized file
cp -r .bash ~/ 

# fix font italic in terminal issue
cat <<EOF|tic -x -
xterm-256color-italic|xterm with 256 colors and italic,
	sitm=\E[3m, ritm=\E[23m,
	use=xterm-256color,

tmux|tmux terminal multiplexer,
  ritm=\E[23m, rmso=\E[27m, sitm=\E[3m, smso=\E[7m, Ms@,
  use=xterm+tmux, use=screen,

tmux-256color|tmux with 256 colors,
  use=xterm+256setaf, use=tmux,
EOF

# setting TERM
grep "xterm-256color-italic" ~/.bashrc >/dev/null 2>&1
rc=$? 
if [[ $rc != 0 ]]; then
   echo "# Setting TERM">> ~/.bashrc 
   echo "export TERM=xterm-256color-italic">> ~/.bashrc 
else
    echo "TERM has already been fixed"
fi 

# tmux config 
cp tmux.conf ~/.tmux.conf

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
