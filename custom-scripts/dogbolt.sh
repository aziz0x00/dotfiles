#!/bin/bash

file=$1

[[ -f $file ]] || (echo "$0 [file]" && exit)

decomps=$(curl "https://dogbolt.org/api/binaries/" -s -F "file=@$file" | jq -r .decompilations_url)

code_url=$(curl "$decomps" -s | jq -r '.results.[]|select(.decompiler.name == "Hex-Rays")|.download_url')

curl "$code_url" -s | gzip -d
