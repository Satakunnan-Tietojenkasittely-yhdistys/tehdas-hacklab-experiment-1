#!/bin/bash
filepath=$1
input_file="${filepath##*/}"
file_no_ext="${input_file%.*}"
output_file_no_ext=output/${file_no_ext}
if [ -f "output/pdf/$input_file" ]; then
    echo "Skipping $input_file . It was extracted already"
else 
    echo "Extracting $input_file"
    # input and shell script must be in same directory
    cp ./batch-pdf-image-extractor.sh output
    mv $filepath output
    pushd output
    ./batch-pdf-image-extractor.sh $filepath
    rm -f batch-pdf-image-extractor.sh
    popd
fi
