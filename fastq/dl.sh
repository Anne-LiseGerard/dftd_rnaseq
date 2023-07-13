#!/bin/bash

# download data using the Basespace CLI


# get a list of the datasets for the current project DEA5_05
~/bin/bs list datasets | grep DEA5_05 | cut -d ' ' -f2 > datasets.txt

# download each fastq
for DATA in $(cat datasets.txt) ; do
   echo $DATA
   ~/bin/bs download dataset -n $DATA
done
