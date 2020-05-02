USER=ereinertsen@mgh.harvard.edu
SERVER=//mad3.partners.org

# Mount directory on LandMark4 containing daily ECG dumps
# LABDIR="PHS-RISC-LM4/MUSE_DATA"
# DESTINATION="/media/lm4-ecg"

# Mount directory on LandMark4 containing CDAC files
#LABDIR="mgh-neuro-cdac/projects/"
#DESTINATION="/media/mad3"

# Mount directory on LandMark4 containing Bedmaster data
LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster"
DESTINATION="/media/lm4-bedmaster/"

sudo mount -t cifs -o user=$USER,uid=1000 $SERVER/$LABDIR $DESTINATION