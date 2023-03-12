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


./process_input_files.sh
./process_output_files.sh
