#!/usr/bin/env bash

# Converts posix path within the linux submodule of win10 to native path within host filesystem.
# supports symbolic links
# supports paths through /mnt/*/ e.g: mnt/c converts to c:\ and so on

FS_ROOT='C:\Users\jfcam\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs'

posix_path=$(realpath "$(pwd)")                             # remove symbolic pathing
posix_path=$(echo "$posix_path" | sed s/\\\//\\\\/g);       # replace / with \
posix_path="${FS_ROOT}${posix_path}"                        # append path to root subsystem fs
posix_path=$(echo $posix_path | sed '$s/.*mnt\\\(.\)/\1:/') # handle access to native fs roots via mnt 

echo ${posix_path}

