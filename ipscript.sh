#!/bin/bash
functie(){

adresa=$(nslookup "$1" "$3" | awk '/^Address:/ {print $2}' | tail -n 2 | head -n 1)

if [ "$adresa" = "$2" ]; then
	echo "Asociere corecta!"
else
	echo "Asociere gresita!"
fi

}

functie fmi.unibuc.ro 192.178.183.139 8.8.8.8
functie wikipedia.org 185.15.59.224 8.8.8.8

