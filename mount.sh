LOGIN=er498
SERVER=//mad3.partners.org

# Set server within MAD3 and mount point on local machine
if [[ "$1" == "ml4icu" ]]; then
    LABDIR="mgh-neuro-cdac/projects/ml4icu"
    MOUNTPOINT="/media/mad3"
elif [[ "$1" == "lm4" ]]; then
    LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster"
    MOUNTPOINT="/media/lm4-bedmaster"
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
    sudo mount -t cifs -o user=$LOGIN,uid=$(id -u),gid=$(id -g),domain=partners $SERVER/$LABDIR $MOUNTPOINT
fi