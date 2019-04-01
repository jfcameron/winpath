# Winpath

## Description
Converts a POSIX path within the filesystem of a linux installation on win10's linux subsystem to a native path within the host filesystem.

Supports symbolic links
Supports paths through /mnt/*/

## Usage
Set the following variable in your bash profile:

    export JFCAMERON_WINPATH_LINUX_ROOT_PATH="C:\path\to\linuxfs"

then refer to winpath.sh -h:

TODO

example uses:

`$explorer.exe $(winpath.sh)` : this would open the current directory in ms explorer

`$code.exe $(winpath.sh main.c)` : this would open main.c in vs code

`$firefox.exe $(git remote get-url origin)` : this would open the web interface for the current local copy

consider adding winpath to your path for the most convenience.
