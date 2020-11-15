LOGIN=er498
SERVER=//mad3.partners.org
GROUP_GROUPNAME=aguirrelab
GROUP_USERNAME=aguirrelab

# Set server within MAD3 and mount point on local machine
if [[ "$1" == "ml4c3" ]]; then
    LABDIR="mgh-neuro-cdac/projects/ml4c3"
    MOUNTPOINT="/media/ml4c3"
elif [[ "$1" == "lm4" ]]; then
    LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster"
    MOUNTPOINT="/media/lm4-bedmaster"
elif [[ "$1" == "alarms" ]]; then
    LABDIR="PHS-RISC-LM4/OriginalData/bedmaster/alarms"
    MOUNTPOINT="/media/lm4-alarms"
elif [[ "$1" == "ecg" ]]; then
    LABDIR="PHS-RISC-LM4/MUSE_DATA"
    MOUNTPOINT="/media/lm4-ecg"
fi

# Mount ERISOne
if [[ "$1" == "erisone" ]]; then
    SERVER=//eris1fs2.partners.org
    MOUNTPOINT=/media/erisone
    sudo mount -t cifs -o user=$LOGIN,uid=$(id -u),gid=$(id -g),vers=1.0 $SERVER/$USER $MOUNTPOINT
else
    sudo mount -t cifs -o user=$LOGIN,uid=$(id -u $GROUP_USERNAME),gid=$(id -g $GROUP_GROUPNAME),noperm,domain=partners $SERVER/$LABDIR $MOUNTPOINT
fi
