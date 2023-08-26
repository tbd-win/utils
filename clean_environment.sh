#!/bin/sh

SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

# Stop  worldserver and bnetserver
sudo systemctl stop trinitycore-worldserver.service
sudo systemctl stop trinitycore-bnetserver.service

# Drop TrinityCore schemas
mysql --host=localhost --user="$TCORE_DB_USER" --password="$TCORE_DB_PASS" << 'EOF'
    DROP DATABASE auth;
    DROP DATABASE characters;
    DROP DATABASE hotfixes;
    DROP DATABASE world;
EOF

# Clear build environment

rm -rf /opt/TrinityCore/build/*