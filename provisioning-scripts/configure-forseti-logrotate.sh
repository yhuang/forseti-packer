#!/usr/bin/env bash

touch /var/log/forseti.log
chown root:root /var/log/forseti.log

cat > /etc/logrotate.d/forseti << LOGROTATE
/var/log/forseti.log {
  daily
  rotate 30
  missingok
  notifempty
  create 644 root root
}
LOGROTATE

chmod 644 /etc/logrotate.d/forseti
logrotate /etc/logrotate.conf
