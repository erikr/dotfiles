if [[ $OSTYPE == 'darwin'* ]]; then
    # https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
    # Clear PATH before path_helper executes; will prevent it from prepending the default
    # PATH to your (previously) chosen PATH
    if [ -f /etc/profile ]; then
        PATH=""
        source /etc/profile
    fi
    export PATH="/Applications/SnowSQL.app/Contents/MacOS:$PATH"
    export PATH="/usr/bin:$PATH"
    export PATH="/bin:$PATH"
    export PATH="/usr/sbin:$PATH"
    export PATH="/sbin:$PATH"
    export PATH="/usr/local:$PATH"
    export PATH="/usr/local/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
fi

DISABLE_MAGIC_FUNCTIONS=true

setopt AUTO_CD

# Set key binding
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Enable globbing
setopt extended_glob

# Pure theme
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=$
LIGHTGREY=default
zstyle :prompt:pure:user color $LIGHTGREY
zstyle :prompt:pure:host color $LIGHTGREY
zstyle :prompt:pure:virtualenv color $LIGHTGREY
prompt pure

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
plugins=(git tmux docker docker-compose zsh-syntax-highlighting zsh-autosuggestions gitfast)

ZSH_DISABLE_COMPFIX="true"
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set default editor to vim
export EDITOR=$(which vim)

# Source aliases
source $HOME/.aliases

# Set all path entries to unique
# https://til.hashrocket.com/posts/7evpdebn7g-remove-duplicates-in-zsh-path
typeset -aU path

# Do not correct variables to dotfile versions
CORRECT_IGNORE_FILE=".*"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

# Add GPG key
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/erik/Desktop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/erik/Desktop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/erik/Desktop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/erik/Desktop/google-cloud-sdk/completion.zsh.inc'; fi
