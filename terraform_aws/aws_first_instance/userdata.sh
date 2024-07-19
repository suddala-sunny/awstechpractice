#!/bin/bash
apt-get install nginx -y
service nginx start
echo "My hostname is $(hostname).  This is hosted in Mumbai." > /var/www/html/index.html
systemctl reboot nginx