#!/bin/sh

git clone https://github.com/vim/vim.git

cd vim

case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'
     brew install ncurses
     ;;

   Linux)
     echo 'Linux'
     sudo apt install libncurses5-dev
     ;;

   *)
     echo 'Other OS'
     ;;
esac

 ./configure --with-features=huge --with-tlib=ncurses --enable-python3interp --with-python3-config-dir=/usr/bin/python3.8-config

make

sudo make install
