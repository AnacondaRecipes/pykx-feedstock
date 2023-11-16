#!/bin/bash

# Store existing QLIC env vars and set to this conda env
# so other QLIC installs don't pollute the environment

if [[ -n "$QLIC" ]]; then
    export _CONDA_SET_QLIC="$QLIC"
fi

# set QLIC to tmp dir as per customer request
export QLIC="/tmp"
