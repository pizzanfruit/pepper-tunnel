#!/bin/sh
set -e
certbot --nginx --non-interactive --agree-tos -m longth.hust@gmail.com -d $PEPPER_HOST_NAME
certbot renew --dry-run
nginx -g 'daemon off;'