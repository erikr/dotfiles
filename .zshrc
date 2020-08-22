setopt AUTO_CD

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

# Gems path 
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# Enable globbing
setopt extended_glob

ZSH_THEME="typewritten"
export TYPEWRITTEN_PROMPT_LAYOUT='multiline'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Disable case-sensitive globbing
unsetopt CASE_GLOB

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

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

# https://conda.io/projects/conda/en/latest/user-guide/troubleshooting.html#resolution-for-python-packages-make-sure-you-have-not-set-the-pythonpath-or-pythonhome-variable
unset PYTHONPATH

# Set all path entries to unique
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
        echo "Setting up .zshrc on ERISOne"

        # Update LD_LIBRARY_PATH so tmux sees custom-installed libevent stuff
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/local/lib

        # Set up modules
        module purge
        module load git/2.17.0
        module load tmux/2.3
        module load vim/8.1-pyvim
        module rm Extras-anaconda2/default

        CONDA_PATH_PREFIX="$HOME/miniconda3"

    # Stultz Lab workstations
    elif [[ $(hostname) = "anduril" ]]; then
        CONDA_PATH_PREFIX="/home/stultzlab/miniconda3"
 
    # Aguirre Lab workstations
    elif [[ $(hostname) = "mithril" ]] || \
         [[ $(hostname) = "everest" ]] || \
         [[ $(hostname) = "montserrat" ]] || \
         [[ $(hostname) = "olympus" ]]; then
        CONDA_PATH_PREFIX="/home/aguirrelab/miniconda3"

        # Set postgres database name
        export PGDATABASE="ecgs"

    # MIT Quanta server
    elif [[ $(hostname) = stultzlab* ]]; then
        CONDA_PATH_PREFIX="/opt/miniconda"
    fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
    CONDA_PATH_PREFIX="$HOME/miniconda3"
fi

# activate conda
source $CONDA_PATH_PREFIX/etc/profile.d/conda.sh 

# If tmux not running, activate the environment
# If on linux and logged in to mithril or anduril, start Dropbox too
if [[ -z "$TMUX" ]]; then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        if [[ $(hostname) = "mithril" ]] || \
           [[ $(hostname) = "anduril" ]]; then
            dropbox start
        fi
        tmux attach -t $(hostname) || tmux new -s $(hostname)
    fi
fi


# Check list of installed conda envs; if desired env is there, activate it
CONDA_CUSTOM_ENV="er"
if [[ $(conda env list | awk '{print $1}' ) = *"$CONDA_CUSTOM_ENV"* ]]; then
    conda deactivate
    conda activate $CONDA_CUSTOM_ENV
fi;


# Add GPG key
export GPG_TTY=$(tty)
