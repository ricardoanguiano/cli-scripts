#!/bin/sh

# Suffix independent image resizing.
# argument 1: file name
# argument 2: desired resolution in WxH format like 800x600

set -e
set -u

# We need two arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 file-name WxH"
    exit 1
fi

INNAME=$1
RES=$2
BASE=$(basename -- "$INNAME")
EXT="${INNAME##*.}"
BASE="${BASE%.*}"
# echo $BASE
# echo $EXT
OUTNAME="${BASE}.${RES}.${EXT}"

convert "$1" -resize "${RES}" "${OUTNAME}"
