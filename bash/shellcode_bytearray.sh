#!/bin/bash

echo -n "{"
objdump -d $1 \
	| grep '[0-9a-f]:' \
	| cut -d$'\t' -f2 \
	| grep -v 'file' \
	| tr -d " \n" \
	| sed 's/../0x&, /g'
echo "0x00 }"
