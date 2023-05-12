# Dependencies:
#   1. Make sure to have rsync installed on the PI:
#      sudo apt-get install rsync
#
#   2. Also make sure to have the creyfnas hostkey in ~/.ssh/known_hosts
#
#   3. Copy your ssh key into the ~/.ssh directory
#        ~/.ssh/id_rsa
#
HOST=$(hostname)

#rsync -e "/usr/bin/ssh -vvv -p 22222" -azSP --delete-after /data/pictures/ jcreyf@192.168.2.190:/volume1/photo/camera-pi/${HOST}/

#scp -P 22222 -p /data/pictures/*.jpg jcreyf@192.168.2.190:/volume1/photo/camera-pi/${HOST}/

#
# This will find all jpg-files that are older than 10 seconds and copy them to a remote filesystem.
# Then delete them from the local filesystem.
# We can have this run in a cronjob every so often.
#
find /data/pictures/ \
     -name "*.jpg" \
     -not -newermt '-10 seconds' \
     -exec scp -P 22222 -p {} jcreyf@192.168.2.190:/volume1/photo/camera-pi/${HOST}/ \; \
     -exec rm -f {} \;

