#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

function sync() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	sync;
else
	read -p "This might overwrite some shit.  Keep going? (y/n)" -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sync;
	fi;
fi;

unset sync;

# Adding extra setups for vim plugins
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle
vim -u NONE -c "helptags vim-fugitive/doc" -c q

git clone git://github.com/vim-ruby/vim-ruby
git clone git://github.com/tpope/vim-rails
git clone git://github.com/tpope/vim-surround
git clone git://github.com/kien/ctrlp.vim
