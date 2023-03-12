#!/bin/bash

for changed_filepath in `find ./output -name *_changed.wav* 2>/dev/null`; do 
    if [ -f "$changed_filepath" ]; then 
        echo "$changed_filepath"
        ./merge_changed_and_original_wav_files.sh $changed_filepath
    fi 
done
