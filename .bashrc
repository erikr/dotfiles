# The purpose of .bashrc is to:
# 1. Initialize conda by setting the path correctly

echo ".bashrc called!"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/PHShome/er498/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/PHShome/er498/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/PHShome/er498/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/PHShome/er498/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

