#!/bin/bash
filepath=$1
input_file="${filepath##*/}"
file_no_ext="${input_file%.*}"
output_file_no_ext=output/${file_no_ext}
input_file_left=${filepath}
input_file_right=`echo ${input_file_left} | sed s/_changed//g`
output_file=${output_file_no_ext}_stereo.ogg
echo "merging ${input_file_left} ${input_file_right} to ${output_file}"
sox ${input_file_left} ${input_file_right} --channels 2 --combine merge ${output_file}
