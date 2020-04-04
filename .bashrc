echo "~/.bashrc called!"
#export SHELL=$(which zsh)
#$SHELL
#export PATH=/PHShome/er498/local/bin:/usr/lib64/qt-3.3/bin:/PHShome/er498/perl5/bin:/hptc_cluster/lsf/8.0/linux2.6-glibc2.3-x86_64/etc:/hptc_cluster/lsf/8.0/linux2.6-glibc2.3-x86_64/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/ibutils/bin:/opt/puppetlabs/bin

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

