#!/bin/bash

# trim sequences
for FQZ in *.fastq ; do

  skewer -q 20 -t 8 $FQZ 
  FQ1=$(echo $FQZ | sed 's#.fastq$#-trimmed.fastq#')

done
