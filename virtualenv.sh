#!/bin/sh

# Based on https://www.dabapps.com/blog/introduction-to-pip-and-virtualenv-python/
# Defensive bash programming.
set -e
set -u
# We need an argument.
if [ $# -ne 1 ]; then
    echo "Usage: virtualenv.sh project-name"
    exit 1
fi

# setup new virtual environment for python
virtualenv ~/bin/$1
echo "type this to activate your new python environment:"
echo "source ~/bin/$1/bin/activate"
