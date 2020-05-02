DIR=$HOME/dotfiles
files=".zshrc .aliases .dir_colors .vimrc .gitignore .wgetrc .tmux.conf "
for file in $files; do
    echo "Symlinking $HOME/$file to $DIR/$file"
    rm $HOME/$file
    ln -s $DIR/$file $HOME/$file
done
