# Set key binding
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Update paths for Homebrew
export PATH="/usr/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/local:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Update paths for Homebrew Ruby
#export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="~/.gem/ruby/2.7.0/bin:$PATH"
#export PATH="~/.gem/ruby/2.7.0/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/ruby/lib"
#export CPPFLAGS="-I/usr/local/opt/ruby/include"
#export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Enable globbing
setopt extended_glob

ZSH_THEME="typewritten/typewritten"
export TYPEWRITTEN_PROMPT_LAYOUT='singleline_verbose'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Disable case-sensitive globbing
unsetopt CASE_GLOB

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Oh-my-zsh plugins live in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git tmux zsh-syntax-highlighting zsh-autosuggestions)

ZSH_DISABLE_COMPFIX="true"
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set default editor to vim
export EDITOR=$(which vim)

# Source aliases
source $HOME/.aliases

# Functionalize conda init so we can use different paths on different machines
conda_initialize () {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('$1/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$1/anaconda3/etc/profile.d/conda.sh" ]; then
            . "$1/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="$1/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}

# https://conda.io/projects/conda/en/latest/user-guide/troubleshooting.html#resolution-for-python-packages-make-sure-you-have-not-set-the-pythonpath-or-pythonhome-variable
unset PYTHONPATH

# Set all pathe ntries to unique
# https://til.hashrocket.com/posts/7evpdebn7g-remove-duplicates-in-zsh-path
typeset -aU path

# Set up solarized dircolors
export LSCOLORS=exfxfeaeBxxehehbadacea

# Do not correct variables to dotfile versions
CORRECT_IGNORE_FILE=".*"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

# Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
 
    # ERISOne
    if [[ $(hostname) = *research.partners.org ]] || [[ $(hostname) = cmu* ]]; then
        echo "Setting up .zshrc on ERISOne"ERISOne

        # Update LD_LIBRARY_PATH so tmux sees custom-installed libevent stuff
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/local/lib

        # Set up modules
        module purge
        module load vim/8.1-pyvim
        module load git/2.17.0

        CONDA_PATH_PREFIX=$HOME

    # Not ERISOne; other linux environments
    elif [[ $(hostname) = "narya" ]]; then
        CONDA_PATH_PREFIX="/home/cdac/"

    # Aguirre Lab workstations
    elif [[ $(hostname) = "mithril" ]] || \
         [[ $(hostname) = "everest" ]] || \
         [[ $(hostname) = "montserrat" ]] || \
         [[ $(hostname) = "olympus" ]]; then
        CONDA_PATH_PREFIX="/home/aguirrelab/"

        # Set postgres database name
        export PGDATABASE="ecgs"
    fi

# macOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CONDA_PATH_PREFIX=$HOME
fi

# Initialize conda paths, set custom environment, and activate
conda_initialize "$CONDA_PATH_PREFIX"
CONDA_CUSTOM_ENV="py37"
conda deactivate; conda activate $CONDA_CUSTOM_ENV

# Add GPG key 
export GPG_TTY=$(tty)
