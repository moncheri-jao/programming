#!/bin/bash
touch /tmp/ip
ifconfig wlp1s0 | grep 'inet' | cut -d: -f2 > /tmp/ip
sed -i '/^[[:space:]]*$/d' /tmp/ip
awk '{print $2}' /tmp/ip
if ! [ -s /tmp/ip ]; then
	echo "disconnected" > /tmp/ip
	cat /tmp/ip
fi
