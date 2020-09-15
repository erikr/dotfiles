LOGIN=er498
SERVER=//mad3.partners.org
#SERVER=//ideafs.partners.org

# Mount LandMark4 daily ECG dumps
#LABDIR="PHS-RISC-LM4/MUSE_DATA"
#MOUNTPOINT="/media/lm4-ecg"

# Mount MAD3
LABDIR="mgh-neuro-cdac/projects"
MOUNTPOINT="/media/mad3"

# Mount LandMark4 Bedmaster
#LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster"
#LABDIR="PHS-RISC-LM4"
#MOUNTPOINT="/media/lm4-bedmaster"

sudo mount -t cifs -o user=$LOGIN,uid=$(id -u),gid=$(id -g),domain=partners $SERVER/$LABDIR $MOUNTPOINT

# Mount ERISOne
#SERVER=//eris1fs2.partners.org
#MOUNTPOINT=/media/erisone
#sudo mount -t cifs -o user=$LOGIN,uid=$(id -u),gid=$(id -g),vers=1.0 $SERVER/$USER $MOUNTPOINT