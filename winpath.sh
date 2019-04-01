#!/usr/bin/env bash

#---------------------------------------------------------------------
# Help & About
#---------------------------------------------------------------------
printHelp () {
sed 's/^# \{0,1\}//' << Help
#---------------------------------------------------------------------
#
# $progName -- help info 
#
# Summary:
#   Converts a posix path within a linux installation on the linux submodule of win10 to
#   a native path within the host filesystem.
#   supports symbolic links
#   supports paths through /mnt/*/ e.g: mnt/c converts to c:\ and so on
#
# Example Usage:
#   $shortProgName 
#   $shortProgName Workspace/glfw 
#
# $shortProgName: [ -h {path} ]
#   option: -h
#     print this help page
#
#   option: NONE
#     echoes the conversion of pwd
#
#   option: {path}
#     echoes the conversion of the given {path}
#
# Config:
#   JFC_WINPATH_FS_ROOT: the windows path to the root of your linux installation's filesystem
#
# Author:
#   Written by Joseph Cameron | jfcameron.github.io
#   Created on 2019-03-31.
#
#---------------------------------------------------------------------
Help
}

#---------------------------------------------------------------------
# Print info, warning, or error and eit, useful variables
#---------------------------------------------------------------------
progName=$0
shortProgName=`echo $progName|sed 's/^.*\///'`
noAffixProgName=`echo $shortProgName|sed 's/\.[^.]*$//'`
verbose=''
initialArgs="$@"

Log()         { echo -e "$shortProgName:" "$@"; }
Warn()        { echo -e "$shortProgName: \033[1;33mWarning:\033[0m" "$@"; }
Error()       { echo -e "$shortProgName: \033[1;31mError:\033[0m"   "$@" >/dev/stderr; exit 1; }
Print()       { echo -e "$@"; }
RequiredVar() { if [ -z ${!1+x} ]; then printHelp; Error "Required variable \"${1}\" is unset. Hint: ${2}"; fi; }

#---------------------------------------------------------------------
# Configuration
#---------------------------------------------------------------------
RequiredVar "JFC_WINPATH_FS_ROOT" "the windows path to the root of your linux installation's filesystem" 

# ---------------------------------------------------------------------
# Implementation
# ---------------------------------------------------------------------

# \brief converts POSIX path within wsl to windows path
function convertPath()
{
    posix_path=$(realpath "${1}")                             # remove symbolic pathing
    posix_path=$(echo "$posix_path" | sed s/\\\//\\\\/g);       # replace / with \
    posix_path="${JFC_WINPATH_FS_ROOT}${posix_path}"            # append path to root subsystem fs
    posix_path=$(echo $posix_path | sed '$s/.*mnt\\\(.\)/\1:/') # handle access to native fs roots via mnt 
    echo ${posix_path}
}

#---------------------------------------------------------------------
# Mainline begins here
#---------------------------------------------------------------------

if [ $# == 0 ]; then
    convertPath "$(pwd)"
elif [ $# == 1 ]; then
    if [ "$1" == "-h" ]; then 
        printHelp
    else
        convertPath "${1}"
    fi
else
  Error "too many arguments provided. Use -h to display help message."
fi
