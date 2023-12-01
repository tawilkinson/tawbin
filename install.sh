#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -d $HOME/bin ]; then
	mkdir $HOME/bin
fi
# copy files
cp $DIR/clean.sh $HOME/bin/
cp $DIR/make_verb.sh $HOME/bin/

# backup old bashrc
if [ -f $HOME/.bashrc ]; then
	cp $HOME/.bashrc $HOME/.bashrc.bk
fi
cp $DIR/dotfiles/bashrc $HOME/.bashrc
# backup old bash_profile
if [ -f $HOME/.bash_profile ]; then
	cp $HOME/.bash_profile $HOME/.bash_profile.bk
fi
cp $DIR/dotfiles/bash_profile $HOME/.bash_profile
# copy aliases into bash_aliases
if [ -f $HOME/.bash_aliases ]; then
	mv $HOME/.bash_aliases $HOME/.bash_aliases.bk
fi
if [ ! -d $HOME/aliases ]; then
	mkdir $HOME/aliases
fi
for filename in $DIR/aliases/*; do
	echo "Adding $filename to $HOME/.bash_aliases"
	echo "# $filename" >> $HOME/.bash_aliases
	echo "$(<$filename )" >> $HOME/.bash_aliases
	echo "" >> $HOME/.bash_aliases
done
for filename in $HOME/aliases/*; do
	echo "Adding $filename to $HOME/.bash_aliases"
	echo "# $filename" >> $HOME/.bash_aliases
	echo "$(<$filename )" >> $HOME/.bash_aliases
	echo "" >> $HOME/.bash_aliases
done
# backup old vimrc
if [ -f $HOME/.vimrc ]; then
	cp $HOME/.vimrc $HOME/.vimrc.bk
fi
cp $DIR/dotfiles/vimrc $HOME/.vimrc
if [ ! -d $HOME/.vim ]; then
	mkdir $HOME/.vim
fi
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
	if [ ! -d $HOME/.vim/bundle ]; then
		mkdir $HOME/.vim/bundle
	fi
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
cp $DIR/dotfiles/ycm_extra_conf.py $HOME/.vim/.ycm_extra_conf.py

# load bashrc
source $HOME/.bashrc
source $HOME/.bash_profile
# install vim plugins
if hash vim 2>/dev/null; then
	vim +PluginInstall +qall
else
	echo "vim not installed, install vim"
fi

