#!/bin/bash

    archive=$1
    dest_d=$2
    LOG_FILE="extraction_log.txt"

    log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
    }

    if [ $# -ne 2 ]; then
        log_message "Error: Enter the path to the archive file followed by a destination directory."
         echo "Enter the path to the archive file followed by a destination directory."
         exit 1
    fi



    if [ ! -f "$archive" ]; then
        log_message "Error: The archive file does not exist."
        echo "The archive file does not exist."
        exit 1
    fi
    if [ ! -d "$dest_d" ]; then
        log_message "Error: The destination directory does not exist but will be created."
        echo "The destination directory does not exist but will be created."
        mkdir "$dest_d"
    fi

    tar -xzf $archive -C $dest_d

    if [ $? -eq 0 ]; then
        log_message "Files have been restored successfully."
        echo "Files have been restored successfully."
    else
        log_message "Error: Failed to restore files."
        echo "Failed to restore files."
    fi
