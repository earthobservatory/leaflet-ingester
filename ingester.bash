#!/bin/bash
. $(dirname ${0})/env_config.bash
declare -A PRODS

#Unpigz them all
for GZ in "$(find . -name "NSBAS-*.h5.gz")" "$(find . -name "LS-PARAMS*.h5.gz")"
do
    unpigz ${GZ}
done
#Find the product and calculate its destination
TS_PROD="$(find . -name "NSBAS-*.h5")"
TS_DEST="$(basename $(dirname ${TS_PROD})).h5"

PRODS[${TS_PROD}]=${TS_DEST}
#Backup LS product (make primary if desired)
## V2 removing unused ls file here
#LS_PROD="$(find . -name "LS-PARAMS*.h5")"
#LS_DEST="$(basename $(dirname ${LS_PROD}))-ls.h5"
#PRODS[${LS_PROD}]=${LS_DEST}
#Copy LS product
for PROD in ${TS_PROD} ${LS_PROD}
do
   #scp -i ${LEAFLET_SERVER_IDENTITY} ${PROD} "ops@${LEAFLET_SERVER}:${LEAFLET_SERVER_DS_LOCATION}/${PRODS[${PROD}]}"
   mv ${PROD} "${LEAFLET_SERVER_DS_LOCATION}/${PRODS[${PROD}]}"
done
#Nuke all .met.json files to prevent accidental ingest
find . -name "*.met.json" -delete
TSID="$(basename $(find . -mindepth 1 -type d) )"
LURL=${LEAFLET_URL}"?id=${TSID}"
echo "Time Series: ${TSID} ${LURL}"
$(dirname $0)/update-leaflet-url.py ${LURL} ${TSID} || exit 1
