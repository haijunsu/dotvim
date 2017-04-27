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

You also can compile Vim source codes by your self on Linux.


