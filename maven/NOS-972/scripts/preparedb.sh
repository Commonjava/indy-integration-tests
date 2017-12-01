#!/bin/bash

export PG_DATA_DIR=/var/lib/pgsql/data
export SCRIPTS_DIR=`dirname $0`

echo 'will use $PG_DATA_DIR as postgresql data dir'
echo 'the script path for this script is $SCRIPTS_DIR'

sudo -s <<EOF

yum install postgresql-server postgresql-libs postgresql sed -y

postgresql-setup initdb

cp $PG_DATA_DIR/pg_hba.conf $PG_DATA_DIR/pg_hba.conf.bak

sed -i '/^host/, +1 d' $PG_DATA_DIR/pg_hba.conf

echo 'host    all             all             127.0.0.1/32            md5' >> $PG_DATA_DIR/pg_hba.conf

systemctl restart postgresql

EOF

cp $SCRIPTS_DIR/indy.sql /tmp/indy.sql
sudo chown postgres:postgres /tmp/indy.sql

sudo -u postgres -H sh -c "psql -a -f /tmp/indy.sql" 

sudo rm /tmp/indy.sql
