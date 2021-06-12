DIR=$HOME/dotfiles
files=".zshrc .aliases .vimrc .gitignore .wgetrc .tmux.conf "
for file in $files; do
    echo "Attempting to delete $HOME/$file"
    rm $HOME/$file
        
    if [[ "$1" == "make" ]]; then
        echo "Symlinking $HOME/$file to $DIR/$file"
        ln -s $DIR/$file $HOME/$file
    fi
done

# Neovim
echo "Attempting to delete ~/.config/nvim/init.vim"
rm ~/.config/nvim/init.vim
if [[ "$1" == "make" ]]; then
    echo "Symlinking $DIR/init.vim to ~/.config/nvim/init.vim"
    ln -s $DIR/init.vim ~/.config/nvim/init.vim
fi

