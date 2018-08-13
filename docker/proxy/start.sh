#!/bin/bash

haproxy -f /usr/local/etc/haproxy/haproxy.cfg
rm -f /var/run/fail2ban/fail2ban.sock
fail2ban-client -b start
patroneosd -configFile /etc/patroneos/config.json -mode fail2ban-relay &

tail -f /var/log/patroneosd.log /var/log/fail2ban.log
