#!/bin/bash
backup() {

    if [ $# -ne 2 ]; then
        echo "enter a source directory followed by a destination directory"
        exit 1
    fi
    source_d=$1
    dest_d=$2
    if [ ! -d "$source_d" ]; then
        echo "the source directory does not exist"
        exit 1
    fi
    if [ ! -d "$dest_d" ]; then
        echo "the destination direstory does not exist but will be created"
        mkdir "$dest_d"
    fi

    echo "enter an archive name with extension .tar.gz. Default=$source_d-backup"
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

    echo "files have been compressed and backed up with success"

}
