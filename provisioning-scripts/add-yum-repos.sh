#!/usr/bin/env bash

MYSQL_COMMUNITY_REPO=mysql-community.repo
mv /tmp/$MYSQL_COMMUNITY_REPO /etc/yum.repos.d/$MYSQL_COMMUNITY_REPO

RPM_GPG_KEY_MYSQL=RPM-GPG-KEY-mysql
mv /tmp/$RPM_GPG_KEY_MYSQL /etc/pki/rpm-gpg/$RPM_GPG_KEY_MYSQL

yum remove -y mariadb-libs
