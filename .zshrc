# Set key binding
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Update PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set DEFAULT_USER so user@hostname doesn't show
# DEFAULT_USER=`whoami`

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
#export TYPEWRITTEN_MULTILINE=false
export TYPEWRITTEN_SINGLELINE_VERBOSE=true

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Disable case-sensitive globbing
unsetopt CASE_GLOB

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


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
    
    # Set up directory colors via https://github.com/seebi/dircolors-solarized
    eval `dircolors ~/.dir_colors`

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/$USER/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/$USER/anaconda3/etc/profile.d/conda.sh" ]; then
# . "/home/$USER/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        else
# export PATH="/home/$USER/anaconda3/bin:$PATH"  # commented out by conda initialize
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    
    ;;

    # macOS
    darwin*)
   
    # Set up Ruby path
    export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

    # Set up directory colors via https://github.com/seebi/dircolors-solarized
    eval `gdircolors ~/.dir_colors`

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
    echo ".zshrc called! Setting up ERISOne"
    
    # Update LD_LIBRARY_PATH so tmux can see custom-installed libevent stuff
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/local/lib

    # Set up Anaconda
    CONDA_CUSTOM_ENV="py37_erisone"
    module load anaconda
    
    # If Conda enviroment is not activated, do it once
    PYTHON_VER=$(python --version 2>&1)
    if [[ "$PYTHON_VER" != *"Python 3"* ]]; then
        echo "Python 2x detected. Activating conda: ${CONDA_CUSTOM_ENV}"
        source activate $CONDA_CUSTOM_ENV
    fi

# Non-ERISOne scripts
else
    CONDA_CUSTOM_ENV="py37"
    source $HOME/anaconda3/etc/profile.d/conda.sh

    # If we use tmux, we need to deactivate and reactivate conda, see
    # https://github.com/conda/conda/issues/6826
    [[ -z $TMUX ]] || conda deactivate
    conda activate $CONDA_CUSTOM_ENV
fi

export PATH="/usr/local/sbin:$PATH"

# Set postgres database name
export PGDATABASE="ecgs"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/er498/google-cloud-sdk/path.zsh.inc' ]; then . '/home/er498/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/er498/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/er498/google-cloud-sdk/completion.zsh.inc'; fi

# Set up solarized dircolors
export LSCOLORS=exfxfeaeBxxehehbadacea

# Do not correct ssh to .ssh
CORRECT_IGNORE_FILE=".ssh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
