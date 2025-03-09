#!/bin/bash

# align sequences to reference
for FQ in *-trimmed.fastq ; do

 FILENAME=`echo $FQ | cut -c1-10`

 STAR --runThreadN 16 --genomeDir /home/annelise/sequences/genome --readFilesIn $FQ --outFileNamePrefix $FILENAME

done
