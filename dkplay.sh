#!/bin/bash

#6.453577,54.551898,15.572230,57.843784
schq="https://opensky-network.org/api/states/all?lamin=45.8389&lomin=5.9962&lamax=47.8229&lomax=10.5226"
dkq="https://opensky-network.org/api/states/all?lamin=45.8389&lomin=5.9962&lamax=47.8229&lomax=10.5226"
lamin=$1
lamax=$2
lomin=$3
lomax=$4
user="thorwulf"
pw="d5pljrtr!"
baseurl="https://opensky-network.org/api/states/all?"
qurl="lamin="$lamin"&lomin="$lomin"&lamax="$lamax"&lomax="$lomax
curl -u "$user:$pw" -k  "$baseurl$qurl" -s | python -mjson.tool
#curl -u "$user:$pw" -k  "$schq" -s | python -mjson.tool

