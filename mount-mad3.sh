USER=er498
SERVER=//mad3.partners.org
#SERVER=//ideafs.partners.org

# Mount LandMark4 daily ECG dumps
#LABDIR="PHS-RISC-LM4/MUSE_DATA"
#MOUNTPOINT="/media/lm4-ecg"

# Mount MAD3 CDAC server
LABDIR="mgh-neuro-cdac/projects/"
MOUNTPOINT="/media/cdac"

# Mount LandMark4 Bedmaster
#LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster"
#LABDIR="PHS-RISC-LM4"
#MOUNTPOINT="/media/lm4-bedmaster"

sudo mount -t cifs -o user=$USER,uid=$(id -u),gid=$(id -g aguirrelab),domain=partners $SERVER/$LABDIR $MOUNTPOINT