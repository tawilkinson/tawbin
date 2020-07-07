#!/bin/bash
# Check GCC version
currentver="$(gcc -dumpversion)"
requiredver="10"
if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -n | head -n1)" = "$requiredver" ]; then 
	echo "Adding GCC 10 symlinks"
	if [ ! -L $HOME/gcc/gcc10 ]; then
		ln -s /usr/bin/gcc $HOME/gcc/gcc10
	fi
	if [ ! -L $HOME/gcc/cc10 ]; then
		ln -s /usr/bin/gcc $HOME/gcc/cc10
	fi
	if [ ! -L $HOME/gcc/g++10 ]; then
		ln -s /usr/bin/g++ $HOME/gcc/g++10
	fi
	if [ ! -L $HOME/gcc/c++10 ]; then
		ln -s /usr/bin/c++ $HOME/gcc/c++10
	fi
else
	echo "No GCC 10, install GCC 10"
fi

if hash /opt/gcc46/bin/gcc-4.6 2>/dev/null; then
	echo "Adding GCC 4 symlinks"
	if [ ! -L $HOME/gcc/gcc4 ]; then
		ln -s /opt/gcc46/bin/gcc-4.6 $HOME/gcc/gcc4
	fi
	if [ ! -L $HOME/gcc/cc4 ]; then
		ln -s /opt/gcc46/bin/gcc-4.6 $HOME/gcc/cc4
	fi
	if [ ! -L $HOME/gcc/g++4 ]; then
		ln -s /opt/gcc46/bin/g++-4.6 $HOME/gcc/g++4
	fi
	if [ ! -L $HOME/gcc/c++4 ]; then
		ln -s /opt/gcc46/bin/c++-4.6 $HOME/gcc/c++4
	fi
else
	echo "No GCC 4, install GCC 4"
fi
