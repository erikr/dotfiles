!/bin/bash

# This script creates symlinks from the home directory to here
dir=~/dotfiles
files=".zshrc .aliases .dir_colors .vimrc .gitignore .wgetrc .tmux.conf .hushlogin"
echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
    echo "Creating symlink to $file in home directory."
	rm ~/$file
    ln -s $dir/$file ~/$file
done
