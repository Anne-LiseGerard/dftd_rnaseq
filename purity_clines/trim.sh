#!/bin/bash

# trim sequences
for FQZ1 in *R1*.fastq ; do

  FQZ2=$(echo $FQZ1 | sed 's#_R1_#_R2_#' )
  NEWNAME=$(echo $FQZ1 | cut -c 1-7)

  skewer -q 20 -t 8 -o $NEWNAME $FQZ1 $FQZ2 

  rm $FQZ1
  rm $FQZ2

done
