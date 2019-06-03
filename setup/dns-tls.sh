#!/bin/bash
# DNS-TLS
# -----------------------------------------------

# This script configures nginx to be a dns-tls proxy
# must be run after we have SSL certificates.

source setup/functions.sh # load our functions
source /etc/mailinabox.conf # load global vars

if [ ! -f /etc/nginx/dnstls.conf ]; then
  cp conf/nginx-dnstls.conf /etc/nginx/dnstls.conf;
fi

if ! grep -q dnstls.conf /etc/nginx/nginx.conf; then
  echo "include /etc/nginx/dnstls.conf;" >> /etc/nginx/nginx.conf
fi
