#!/bin/bash
DOMAIN="aglacloud,spartan-lappy,spartan-smp"
TOKEN={token}
URL="https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&ip="

response=$(curl -s "$URL")
echo "$(date): $response" >> ~/duckdns/duckdns.log
