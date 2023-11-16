#!/bin/bash
# Restore previous GLIC env vars if they were set

unset GLIC
if [[ -n "$_CONDA_SET_GLIC" ]]; then
    export GLIC=$_CONDA_SET_GLIC
    unset _CONDA_SET_GLIC
fi