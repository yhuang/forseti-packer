#!/usr/bin/env bash

CLOUDSQL_PROXY=/usr/local/bin/cloudsql-proxy

wget -O $CLOUDSQL_PROXY https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64

chmod a+x $CLOUDSQL_PROXY
