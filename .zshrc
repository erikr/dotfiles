# Set key binding
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Update PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable globbing
setopt extended_glob

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="typewritten/typewritten"

# Enable multine typewritten theme
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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# Set default editor to vim
export EDITOR=$(which vim)

# Source aliases
source $HOME/.aliases

# OS-dependent aliases
case "$OSTYPE" in
    # Linux
    linux*)  
    ;;

    # macOS
    darwin*)
   
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/$USER/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/$USER/anaconda3/etc/profile.d/conda.sh" ]; then
            # . "/Users/$USER/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        else
            # export PATH="/Users/$USER/anaconda3/bin:$PATH"  # commented out by conda initialize
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    ;;
esac

# ERISOne scripts
if [[ $HOSTNAME = *research.partners.org ]] || [[ $HOSTNAME = cmu* ]]; then
    echo "Setting up .zshrc on ERISOne"
    
    # Update LD_LIBRARY_PATH so tmux can see custom-installed libevent stuff
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/local/lib

    # Set up modules
    module purge
    module load vim/8.1-pyvim
    module load git/2.17.0
fi

# https://conda.io/projects/conda/en/latest/user-guide/troubleshooting.html#resolution-for-python-packages-make-sure-you-have-not-set-the-pythonpath-or-pythonhome-variable
unset PYTHONPATH

# Set up conda and activate custom environment
source $HOME/anaconda3/etc/profile.d/conda.sh
CONDA_CUSTOM_ENV="py37"
conda deactivate; conda activate $CONDA_CUSTOM_ENV

export PATH="/usr/local/sbin:$PATH"

# Set postgres database name
export PGDATABASE="ecgs"

# Set up solarized dircolors
export LSCOLORS=exfxfeaeBxxehehbadacea

# Do not correct variables to dotfile versions
CORRECT_IGNORE_FILE=".*"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
