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
	echo "GCC is still $currentver"
 else
        echo "GCC version is <10.0.0"
	rm /usr/bin/cc
	rm /usr/bin/gcc
	rm /usr/bin/c++
	rm /usr/bin/g++
	ln -s /usr/bin/gcc10 /usr/bin/gcc
	ln -s /usr/bin/gcc10 /usr/bin/cc
	ln -s /usr/bin/g++10 /usr/bin/g++
	ln -s /usr/bin/c++10 /usr/bin/c++
	echo "GCC symlinks set to GCC 10"
 fi
