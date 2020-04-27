USER=ereinertsen@mgh.harvard.edu
SERVER=//mad3.partners.org
#LABDIR=PHS-RISC-LM4/MUSE_DATA
#LABDIR="mgh-neuro-cdac/projects/"
#LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster/BLK8"
LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster"
DESTINATION=/media/lm4
sudo mount -t cifs -o user=$USER,uid=1000 $SERVER/$LABDIR $DESTINATION