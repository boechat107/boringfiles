#!/bin/bash

set -eo pipefail

ORIGIN="$PWD"/boringfiles

mklink() {
    declare fname="$1"
    arrName=(${fname//__/ })
    lastName="${arrName[-1]}"
    ## Checking if the file name points to a directory.
    if [[ -d "$ORIGIN"/"${arrName[-1]}" ]]
    then
        isDir='1'
    else
        isDir='0'
    fi
    printf "\ndir: %s" "$isDir"
    printf "\nlast: %s" "$lastName"
    ## Checking if the path has dot. If it has, we need to add a dot to the
    ## first path name.
    if [[ "${arrName[0]}" == 'd' ]]
    then
        ## Take all elements but the first (the simple "d").
        arrPath=("${arrName[@]:1}")
        ## Add a "." to the first name.
        arrPath[0]='.'"${arrPath[0]}"
    else
        arrPath=("${arrName[@]}")
    fi
    printf "\n%s\n" "${arrPath[@]}"
    pathVal="$HOME"$(printf "/%s" "${arrPath[@]%/}")
    printf "\n%s" "$ORIGIN"/"$fname"
    printf "\n%s\n" "$pathVal"
    ## Executing the actions of removal and symbolic linking.
    printf "\nRemoving the file %s\n" "$pathVal"
    rm -rf "$pathVal"
    printf "\nCreating link from %s" "$ORIGIN"/"$fname"
    ln -s "$ORIGIN"/"$fname" "$pathVal"
}

mklink "$@"
