#!/bin/bash

> ./id.yml
echo "os_list:" >> ./id.yml
cat device/bela-pocketbeagle2-am62/bela-stable.yml >> ./id.yml

cat ./id.yml | yq > os_list.json
rm ./id.yml

cat os_list.json | jq > os_list.json.bak
mv os_list.json.bak os_list.json

if [ -f /usr/bin/jsonlint-php ] ; then
	jsonlint-php os_list.json
fi
