#!/bin/sh

set -e
set -u

if [ $# -ne 1 ]; then
    echo "Usage: $0 URL"
    exit 1
fi

aria2c --max-concurrent-downloads=5 --max-connection-per-server=5 --min-split-size=1M "$1"
