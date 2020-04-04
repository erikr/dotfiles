!/bin/bash

# This script creates symlinks from the home directory to here

dir=~/repos/dotfiles
files=".zshrc .aliases .bashrc .bash_profile .dir_colors .vim .vimrc .gitignore .gitconfig .wgetrc .tmux.conf .hushlogin"
echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
    echo "Creating symlink to $file in home directory."
	rm ~/$file
    ln -s $dir/$file ~/$file
done
