#!/bin/bash

restore() {

    if [ $# -ne 2 ]; then
         echo "Enter the path to the archive file followed by a destination directory."
         exit 1
    fi

    archive=$1
    dest_d=$2

    if [ ! -f "$archive" ]; then
        echo "The archive file does not exist."
        exit 1
    fi
    if [ ! -d "$dest_d" ]; then
        echo "The destination directory does not exist but will be created."
        mkdir "$dest_d"
    fi

    tar -xzf $archive -C $dest_d

    if [ $? -eq 0 ]; then
        echo "Files have been restored successfully."
    else
        echo "Failed to restore files."
    fi
}
