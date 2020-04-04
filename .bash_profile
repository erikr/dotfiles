echo ".bash_profile called!"
source ~/.bashrc
#export PATH=/PHShome/er498/local/bin:/usr/lib64/qt-3.3/bin:/PHShome/er498/perl5/bin:/hptc_cluster/lsf/8.0/linux2.6-glibc2.3-x86_64/etc:/hptc_cluster/lsf/8.0/linux2.6-glibc2.3-x86_64/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/ibutils/bin:/opt/puppetlabs/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/local/lib
#exec zsh

export PATH=$HOME/local/bin:$PATH
export SHELL=`which zsh`
[ -f "$SHELL" ] && exec "$SHELL" -l
