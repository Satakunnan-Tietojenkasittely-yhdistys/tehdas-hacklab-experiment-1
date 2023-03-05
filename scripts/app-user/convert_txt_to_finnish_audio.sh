#!/bin/bash
filepath=$1
input_file="${filepath##*/}"
file_no_ext="${input_file%.*}"
output_file_no_ext=output/${file_no_ext}
echo "Converting $input_file to .wav"
cat ${filepath} | iconv -f UTF-8 -t ISO8859-1 -c | text2wave -otype wav -eval '(language_finnish)' -o ${output_file_no_ext}.wav
echo "Converting $input_file to .flac"
cat ${filepath} | iconv -f UTF-8 -t ISO8859-1 -c | text2wave -otype wav -eval '(language_finnish)' -o /tmp/ttv > /tmp/ttv2 && sox /tmp/ttv ${output_file_no_ext}.flac remix - norm -7 highpass 10 gain -2 treble -40 rate 48k norm -5 dither contrast 4 echos 0.8 0.7 7 0.25 7 0.3
