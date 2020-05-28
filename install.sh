#!/bin/bash
if [ ! -d $HOME/bin ]; then
	mkdir $HOME/bin
fi
# copy files
cp ./setup_gcc.sh $HOME/bin/
$HOME/bin/setup_gcc.sh

#backup old bashrc
if [ ! -f $HOME/.bashrc ]; then
	cp $HOME/.bashrc $HOME/.bashrc.bk
fi
cp dotfiles/bashrc $HOME/.bashrc
#backup old vimrc
if [ ! -f $HOME/.vimrc ]; then
	cp $HOME/.vimrc $HOME/.vimrc.bk
fi
cp dotfiles/vimrc $HOME/.vimrc
if [ ! -d $HOME/.vim ]; then
	mkdir $HOME/.vim
fi
cp dotfiles/ycm_extra_conf.py $HOME/.vim/.ycm_extra_conf.py

#load bashrc
source $HOME/.bashrc
#install vim plugins
if hash vim 2>/dev/null; then
	vim +PluginInstall +qall
else
	echo "vim not installed, install vim"
fi

