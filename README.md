# Winpath

## Description
Converts a POSIX path within the filesystem of a linux installation on win10's linux subsystem to a native path within the host filesystem.

Supports symbolic links

Supports paths through /mnt/*/

## Usage
Set the following variable in your bash profile:

    export JFC_WINPATH_FS_ROOT="C:\path\to\linuxfs"

then refer to winpath.sh -h:

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

example uses:

`$explorer.exe $(winpath.sh)` : this would open the current directory in ms explorer

`$code.exe $(winpath.sh main.c)` : this would open main.c in vs code

consider adding winpath to your path for the most convenience.
