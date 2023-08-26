#!/bin/sh

SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

# Import TrinityCore schemas from seed
mysql --host=localhost --user="$TCORE_DB_USER" --password="$TCORE_DB_PASS" << cata_dev_seed.sql

# Pull branch
cd /opt/TrinityCore
git checkout $DEPLOY_BRANCH
git pull

# Build source
cd /opt/TrinityCore/build/
cmake ../ -DCMAKE_INSTALL_PREFIX=/home/tcore/tcore-server -DTOOLS=0
make -j 4
make install