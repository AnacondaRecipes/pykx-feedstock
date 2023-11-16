@REM Restore previous GLIC env vars if they were set

@set "GLIC="
@if defined GLIC (
  set "GLIC=%_CONDA_SET_GLIC%"
  set "_CONDA_SET_GLIC="
)
