#!/bin/bash

# convert to .bam, sort and index
for SAM in *.sam ; do

 SAMPLE=`echo $SAM | cut -c1-10`
 FILENAME=`echo $SAMPLE'.bam'`
 SORTED=`echo $SAMPLE'-sorted.bam'`
 INDEX=`echo $SAMPLE'-sorted.bai'`

 samtools view -bS $SAM -o $FILENAME
 samtools sort $FILENAME -o $SORTED
 samtools index -c $SORTED $INDEX

 echo $SAMPLE' done'

done

