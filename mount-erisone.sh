USER="er498"
MOUNTDIR="/media/erisone_er498"
# sudo sshfs -o allow_other $USER@erisone.partners.org:/PHShome/$USER $MOUNTDIR
sudo mount -t cifs -o username=$USER,domain=partners,vers=1.0,uid=1000 //eris1fs2.partners.org/$USER $MOUNTDIR