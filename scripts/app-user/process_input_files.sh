#!/bin/bash
echo "running as `whoami`"

if [ -d input ]; then
    echo "input-folder found."
else 
    echo "please provide input directory"
fi
if [ -d output ]; then
    echo "output-folder found."
else
    echo "please provide output directory."
    echo 'Run docker with command: docker run --rm -it -v $(pwd)/input:/home/app-user/input:rw -v $(pwd)/output:/home/app-user/output:rw tehdashacklabexperiment1' 
    exit
fi

# TODO replace with parameters from docker run
echo "fetching test pdf data"
wget https://tehdasry.fi/wordpress/wp-content/uploads/2020/10/tehdas_portfolio.pdf 
cp tehdas_portfolio.pdf input

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
