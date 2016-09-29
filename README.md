# CouchDB-Bash-Script-To-Verify-And-Add-Replication
CouchDB Bash Script To Verify And Add Replication


# Installation

curl https://raw.githubusercontent.com/yahat/CouchDB-Bash-Script-To-Verify-And-Add-Replication/master/couch_replicate.sh > couch_replicate.sh

OR

wget https://raw.githubusercontent.com/yahat/CouchDB-Bash-Script-To-Verify-And-Add-Replication/master/couch_replicate.sh

THEN

chmod +x couch_replicate.sh

THEN

edit with your favourite editor, change the first 4 lines

LOCAL="[ip of current server]"
PORT="[couch db port of all servers]"
DB="[database name to be replicated]"
REMOTE=("[ip1]" "[ip2]")

add as many ip's as you want, in quotes

THEN

./couch_replicate.sh

OR

put it in cron