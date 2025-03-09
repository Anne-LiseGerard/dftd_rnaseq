#!/bin/bash

# convert to .bam, sort and index
for BAM in *.bam ; do

 SAMPLE=`echo $BAM | cut -c1-7`
 FILENAME=`echo $SAMPLE'.bam'`
 SORTED=`echo $SAMPLE'-sorted.bam'`
 INDEX=`echo $SAMPLE'-sorted.bai'`

# samtools view -bS $SAM -o $FILENAME
 samtools sort $BAM -o $SORTED
 samtools index -c $SORTED $INDEX

 echo $SAMPLE' done'

done

