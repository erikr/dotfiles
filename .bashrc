# This file is for setting up colored ls output in bash.

# Set the LS_COLORS environment variable to define the colors for different file types.
export LS_COLORS="$LS_COLORS:ow=1;31:ow=1;34:di=1;34:di=1;34:fi=1;37:fi=1;34:"

# Define aliases for different ls commands with colored output.
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'