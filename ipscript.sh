#!/bin/bash

cat /etc/hosts | while read ip nume rest
do
        [ -z "$ip" ] && break

        adresa=$(nslookup $nume 8.8.8.8 | grep "Address" | tail -n +2 | grep -w "$ip")

        if [ -z "$adresa" ]; then
                echo "Bogus IP for $nume in /etc/hosts!"
        fi
done
