USEREMAIL="ereinertsen@mgh.harvard.edu"
SERVER="//mad3.partners.org"
LABDIR="mgh-neuro-cdac"
#LABDIR="PHS-RISC-LM4"
#LABDIR="PHS-RISC-LM4/ConvertedData/bedmaster/BLK8"
DESTINATION="/media/mad3"
sudo mount -t cifs -o user=$USEREMAIL,uid=1000 $SERVER/$LABDIR $DESTINATION