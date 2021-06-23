DIR=$HOME/dotfiles
files=".zshrc .aliases .vimrc .gitignore .wgetrc .tmux.conf .bash_profile"
for file in $files; do
    echo "Attempting to delete $HOME/$file"
    rm $HOME/$file
    echo "Symlinking $HOME/$file to $DIR/$file"
    ln -s $DIR/$file $HOME/$file
done

NVIM_DIR=$HOME/.config/nvim
echo "Symlinking $DIR/init.vim to $NVIM_DIR/init.vim"
mkdir -p $NVIM_DIR
rm $NVIM_DIR/init.vim
ln -s $DIR/init.vim $NVIM_DIR/init.vim
