#!/bin/bash

#set -x
INDY_WORKDIR=$1

if [ "x${INDY_WORKDIR}" == "x" ]; then
	echo "Usage: ${0} <indy-workdir>"
    exit 1
fi

INDY_HOME=${INDY_WORKDIR}/deployments/launchers/savant/target/indy

GROUP=DA
METADATA_PATH=org/apache/apache/maven-metadata.xml
TRIES=${TRIES:-2}
DOWNLOADS=${DOWNLOADS:-4}
WAIT=${WAIT:-16}

rm -rf output
mkdir output

i=1
while [ $i -le $TRIES ]; do
	OUT=output/out-$(date -u +%s)

	mkdir $OUT

	echo "Attempt #${i} (${OUT})"
	for g in group-$GROUP group-public remote-central remote-mrrc; do
		if [ -f ${INDY_HOME}/var/lib/indy/storage/$g/$METADATA_PATH ]; then
			rm ${INDY_HOME}/var/lib/indy/storage/$g/$METADATA_PATH
		fi
	done

	d=1
	while [ $d -le $DOWNLOADS ]; do
		echo "Download #${i}.${d}"
		curl -v http://localhost:8080/api/group/$GROUP/$METADATA_PATH > $OUT/out${d}.xml 2> $OUT/err${d}.txt &
		d=$(($d + 1))
	done

	echo "Sleeping $WAIT to allow downloads to complete..."
	sleep $WAIT
	cp -rf ${INDY_HOME}/var/log/indy $OUT

	ls -al $OUT/out*.xml | awk '{print $5}' | sort | uniq
	count=$(ls -al $OUT/out*.xml | awk '{print $5}' | sort | uniq | wc -l)

	if [ $count != 1 ]; then
		echo "HIT!"
		# i=$TRIES
	else
		echo "MISS."
	fi

	i=$(($i + 1))
done