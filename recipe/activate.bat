@REM Store existing GLIC env vars and set to this conda env
@REM so other GLIC installs don't pollute the environment

@if defined GLIC (
    set "_CONDA_SET_GLIC=%GLIC%"
)
@set "GLIC=%SOME_PATH%"
