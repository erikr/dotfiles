DIR=$HOME/dotfiles
files=".zshrc .aliases .dir_colors .vimrc .gitignore .wgetrc .tmux.conf .dir_colors"
for file in $files; do
    echo "Attempting to delete $HOME/$file"
    rm $HOME/$file
        
    if [[ "$1" == "make" ]]; then
        echo "Making symlinks from $HOME/$file to $DIR/$file"
        ln -s $DIR/$file $HOME/$file
    fi
done
