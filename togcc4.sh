#!/bin/bash
# Check running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
# Check GCC version
currentver="$(gcc -dumpversion)"
requiredver="10"
 if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -n | head -n1)" = "$requiredver" ]; then 
        echo "GCC version is >=10.0.0"
	# Fedora installs gcc directly to /usr/bin, backup
	cp /usr/bin/gcc /usr/bin/gcc10
	cp /usr/bin/g++ /usr/bin/g++10
	cp /usr/bin/c++ /usr/bin/c++10
	rm /usr/bin/cc
	rm /usr/bin/gcc
	rm /usr/bin/c++
	rm /usr/bin/g++
	ln -s /opt/gcc46/bin/gcc-4.6 /usr/bin/gcc
	ln -s /opt/gcc46/bin/gcc-4.6 /usr/bin/cc
	ln -s /opt/gcc46/bin/g++-4.6 /usr/bin/g++
	ln -s /opt/gcc46/bin/c++-4.6 /usr/bin/c++
	echo "GCC symlinks set to GCC 4.3.6"
 else
        echo "GCC version is <10.0.0"
	echo "GCC is still $currentver"
 fi

