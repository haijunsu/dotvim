The powerline needs powerline fonts to show prompt and status line correctly. Please refer [install powerline font](https://blog.happynavy.tk/powerline-shell-vim/) to install it.

Vim needs to support python and lua. Use the following comand to check the requirements.
```
  $ vim --version | grep +python
  $ vim --version | grep +lua
```

Use the following command install macvim on MAC OS X.
```
  $ brew install macvim --with-cscope --with-lua --override-system-vim
```

Most Vim on linux has supported python. But it may not support lua.

You may need install these packages on Ubuntu:
  * vim-nox
  For GUI:
  * vim-gtk
  * vim-gnome
  * vim-athena

You can find rpm packages at <https://www.rpmfind.net/linux/rpm2html/search.php?query=vim-syntastic-lua> for Fedora.

You also can compile [Vim source codes](http://www.vim.org/download.php) by your self on Linux.

Here is an example of [building vim shell script](https://gist.github.com/fundon/1150782) on centos:
```
#!/bin/bash
# on centos minimal

yum install gcc
yum install make
yum install ncurses-devel
yum install lua lua-devel
yum install ruby ruby-devel
yum install python python-devel
yum install perl perl-devel

# vim7.3
./configure --disable-selinux \
--enable-luainterp \
--enable-perlinterp \
--enable-pythoninterp \
--enable-python3interp \
--enable-tclinterp \
--enable-rubyinterp \
--enable-multibyte \
--disable-gui \
--with-features=huge \
--with-modified-by=cfddream@gmail.com

make
make install
```

Here is [an example script for Cygwin](https://github.com/Shougo/neocomplete.vim).
```
cd /usr/src
tar jxf vim-7.4.tar.bz2
tar xvfz lua-5.1.5.tar.gz
cd vim74/
./configure --enable-luainterp --enable-gui=no \
--without-x --enable-multibyte --prefix=/usr
make && make install
```
