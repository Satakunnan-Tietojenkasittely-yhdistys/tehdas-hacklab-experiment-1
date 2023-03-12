#!/bin/bash

for filepath in input/*; do 
    if [ -f "$filepath" ]; then 
        echo "$filepath"
        extension="${filepath##*.}"
        echo "extension = $extension"
        if [ "$extension" == "txt" ]; then
            ./convert_txt_to_finnish_audio.sh $filepath
        fi
        if [ "$extension" == "pdf" ]; then
            ./extract_pdf_file.sh $filepath
        fi
    fi 
done
