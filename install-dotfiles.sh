#!/bin/bash

mv .git ~/
mv .ipython ~/
mv .vim ~/
mv bin ~/
mv .aliasrc ~/
mv .bashrc ~/
mv .colordiffrc ~/
mv .gitconfig ~/
mv .gitignore ~/
mv .pdbrc ~/
mv .vimrc ~/
mv README.rst ~/

OWD=`pwd`
pushd ~
rm -rf $OWD
