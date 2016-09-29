LOCAL="127.0.0.1"
PORT="5984"
DB="database_to_replicate_"
REMOTE=("192.168.1.1" "192.168.1.2" "192.168.1.3")

echo "Getting current active tasks..."
ACTIVE=$(curl "http://$LOCAL:$PORT/_active_tasks" 2>/dev/null)

if [[ ${ACTIVE:0:1} == "[" ]]; then
  echo "$ACTIVE"
else
  echo "ERROR! Reponse does not start with square bracket: $ACTIVE"
  exit 1
fi

for i in ${REMOTE[@]}; do
  echo ""
  echo "------------..."
  echo "Looking for: ${i}"
  if echo "$ACTIVE" | grep -q "\"source\":\"http://${i}:$PORT/$DB/\""; then
    echo " - exists"
  else
    echo " - does not exist"
    echo " - pinging host..."
    ping -c 1 -t 1 ${i} &> /dev/null
    if [ "$?" -eq "0" ]; then
      echo " - host online, adding replication"
      RESULT=$(curl "http://$LOCAL:$PORT/_replicate" -H 'Content-Type: application/json' --data-binary "{\"source\":\"http://${i}:$PORT/$DB/\",\"target\":\"$DB\",\"continuous\"$
      echo "$RESULT"
    else
      echo " - host offline, skipping"
    fi
  fi
done
