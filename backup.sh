#!/bin/bash

    source_d=$1
    dest_d=$2
    LOG_FILE="extraction_log.txt"

    log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
    }

    if [ $# -ne 2 ]; then
        log_message "Error: Enter a source directory followed by a destination directory."
        echo "enter a source directory followed by a destination directory."
        exit 1
    fi

    if [ ! -d "$source_d" ]; then
        log_message "Error: The source directory does not exist."
        echo "the source directory does not exist"
        exit 1
    fi
    if [ ! -d "$dest_d" ]; then
        log_message "Creating destination directory..."
        echo "the destination direstory does not exist but will be created"
        mkdir "$dest_d"
    fi
    log_message "Creating archive name..."
    echo "Enter an archive name with extension .tar.gz. Default=$source_d-backup"
    read archive_name #="($source_d)_backup"
    echo "$archive_name before condition"
    if [ -z "$archive_name" ]; then
        archive_name="$source_d-backup.tar.gz"
        echo "$archive_name inner conditionS"
        # tar -czvf "$source_d-backup.tar.gz" $source_d
        # cp -r "$source_d-backup.tar.gz" $dest_d
    # else
    fi
    tar -czvf $archive_name $source_d
    cp -r $archive_name $dest_d
    echo "$archive_name after conditionS"
    log_message "Files have been compressed and backed up  successfully."
    echo "Files have been compressed and backed up  successfully."
