#!/bin/sh
# Install script for dotfiles

rsync -rv --exclude '.git' --exclude 'README.md' --exclude '.gitignore' . ../
