#!/bin/bash

# align sequences to reference

for FQ in 6180777-trimmed-pair1.fastq ; do
  
 FILENAME=`echo $FQ | cut -c1-7`

 FQ1=`echo $FILENAME"-trimmed-pair1.fastq"`
 FQ2=`echo $FILENAME"-trimmed-pair2.fastq"`

 STAR --runThreadN 16 --genomeDir ~/projects/analysis/genome --readFilesIn $FQ1 $FQ2 --outFileNamePrefix $FILENAME

done
