#!/bin/bash

INDY_WORKDIR=$1

if [ "x${INDY_WORKDIR}" == "x" ]; then
	echo "Usage: ${0} <indy-workdir>"
    exit 1
fi

script=$(readlink -fn -- $0)
DIR=$(dirname $script)

export TEST_ETC=$DIR/etc
export TEST_REPOS=$DIR/repos

exec $INDY_WORKDIR/bin/test-setup.sh
