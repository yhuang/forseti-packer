#!/usr/bin/env bash

git clone https://github.com/GoogleCloudPlatform/forseti-security.git
cd forseti-security
FORSETI_HOME_DIR=$(pwd)

git fetch --all
git checkout tags/v$FORSETI_VERSION

# Install Forseti Security
python setup.py install

FORSETI=$(which forseti)
FORSETI_INSTALL_DIR=$(dirname ${FORSETI})

ln -s $FORSETI_INSTALL_DIR/forseti_enforcer $FORSETI_INSTALL_DIR/forseti-enforcer
ln -s $FORSETI_INSTALL_DIR/forseti_server $FORSETI_INSTALL_DIR/forseti-server

chmod -R ug+rwx $FORSETI_HOME_DIR/configs $FORSETI_HOME_DIR/rules
