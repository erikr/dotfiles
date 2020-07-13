USER=er498
#SERVER=//mad3.partners.org
SERVER=//ideafs.partners.org

# Mount directory on LandMark4 containing daily ECG dumps
#LABDIR="PHS-RISC-LM4/MUSE_DATA"
#MOUNTPOINT="/media/lm4-ecg"

# Mount directory on LandMark4 containing CDAC files
#LABDIR="mgh-neuro-cdac/projects/"
#MOUNTPOINT="/media/mad3"

# Mount directory on LandMark4 containing Bedmaster data
LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster"
#LABDIR="PHS-RISC-LM4"
MOUNTPOINT="/media/lm4-bedmaster"

sudo mount -t cifs -o user=$USER,uid=$(id -u),gid=$(id -g aguirrelab),domain=partners $SERVER/$LABDIR $MOUNTPOINT