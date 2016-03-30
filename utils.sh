#!/bin/bash

# Functions with OS dependency
# ============================================
# enum for os environment
ENV_LINUX=0
ENV_OSX=1
ENV_SOLARIS=2
ENV_BSD=3
ENV_Cygwin=4
ENV_OTHER=5


function GetOSEnvironment()
{
  local OS="UNDETECTED" # OS Environment
  case "$OSTYPE" in
    linux*)
      # OS="LINUX" ;;
      OS=$ENV_LINUX ;;
    darwin*)
      # OS="OSX" ;;
      OS=$ENV_OSX ;;
    solaris*)
      # OS="SOLARIS" ;;
      OS=$ENV_SOLARIS ;;
    bsd*)
      # OS="BSD" ;;
      OS=$ENV_BSD ;;
    cygwin)
      # OS="cygwin" ;;
      OS=$ENV_Cygwin ;;
    *)
      OS=$ENV_OTHER ;;
  esac
  echo $OS
}

function GetPackageManager()
{
  local envIndex=$(GetOSEnvironment)
  packageManager[ENV_LINUX]=apt-get
  packageManager[ENV_OSX]=brew
  echo ${packageManager[$envIndex]}
}

function GetPackageInstallCommand()
{
  echo $(GetPackageManager) install
}
