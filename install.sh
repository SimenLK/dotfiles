#!/bin/sh
# Install script for dotfiles

rsync -rv --exclude 'install.sh' \
			--exclude '.git'\
			--exclude 'README.md'\
			--exclude '.gitignore'\
			$PWD/ $HOME
