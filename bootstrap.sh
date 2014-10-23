#!/bin/bash


# Variables 

dir=~/dotfiles
files=".vimrc"

# Symlink files
echo "Begin symlinking"
for file in $files; do
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file ~/.$file
done

echo "All Finished"