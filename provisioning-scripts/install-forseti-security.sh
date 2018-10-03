#!/usr/bin/env bash

FORSETI_SECURITY_REPO=https://github.com/GoogleCloudPlatform/forseti-security.git
FORSETI_SECURITY=$(basename $FORSETI_SECURITY_REPO .git)

cd /opt
git clone $FORSETI_SECURITY_REPO

cd $FORSETI_SECURITY
FORSETI_INSTALL_DIR=$(pwd)

git fetch --all
git checkout tags/v$FORSETI_VERSION

# Patch Forseti Security
cp /tmp/cli.py $FORSETI_INSTALL_DIR/google/cloud/forseti/services/cli.py

# Install Forseti Security
python setup.py install

rm -f $FORSETI_INSTALL_DIR/install/gcp/scripts/*
rm -f $FORSETI_INSTALL_DIR/*.lock

FORSETI=$(which forseti)
FORSETI_DIR=$(dirname ${FORSETI})

ln -s $FORSETI_DIR/forseti_enforcer $FORSETI_DIR/forseti-enforcer
ln -s $FORSETI_DIR/forseti_server $FORSETI_DIR/forseti-server
