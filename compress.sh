#!/bin/sh
#in_dir = /usr/local/in
#out_dir = /usr/local/out
/usr/sbin/brotli /usr/local/in/*
mv /usr/local/in/*.br /usr/local/out/
echo "Finished compressing all files in the input directory"
echo "Number of files in output directory: $(ls -1 | wc -l)"



