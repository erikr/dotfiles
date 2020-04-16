USER="ereinertsen@mgh.harvard.edu"
SERVER="//mad3.partners.org"
LABIDR="PHS-RISC-LM4/MUSE_DATA"
#LABDIR="mgh-neuro-cdac/projects/"
#LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster/BLK8"
DESTINATION="/media/mad3"
sudo mount -t cifs -o user=$USER,uid=1000 $SERVER/$LABDIR $DESTINATION