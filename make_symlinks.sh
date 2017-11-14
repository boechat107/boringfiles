#!/bin/bash

set -eo pipefail

ORIGIN="$PWD"/boringfiles

mklink() {
    declare fname="$1"
    arrName=(${fname//__/ })
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
    pathVal="$HOME"$(printf "/%s" "${arrPath[@]%/}")
    ## Executing the actions of removal and symbolic linking.
    printf "\nRemoving the file %s" "$pathVal"
    rm -rf "$pathVal"
    printf "\nCreating link from %s" "$ORIGIN"/"$fname"
    ln -s "$ORIGIN"/"$fname" "$pathVal"
}

main() {
    for file in boringfiles/*; do
        ## Passing only the file/directory name.
        ## https://stackoverflow.com/a/9011264/747872
        mklink "${file##*/}"
    done
}

main
