#!/bin/bash

# set the ref sequence
REF=../ref/Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.fa.gz.idx


for FQZ1 in *R1_001.fastq.gz ; do

  FQZ2=$(echo $FQZ1 | sed 's#_R1_#_R2_#' )
  skewer -q 10 -t 32 $FQZ1 $FQZ2

  FQ1=$(echo $FQZ1 | sed 's#.gz$#-trimmed-pair1.fastq#')
  FQ2=$( echo $FQ1 | sed 's#pair1.fastq#pair2.fastq#' )

  kallisto quant \
  -i $REF \
  -o ${FQ1}_kal -t 32 $FQ1 $FQ2

  rm $FQ1 $FQ2

done


for TSV in */abundance.tsv ; do
  NAME=$(echo $TSV | cut -d '_' -f1) ; cut -f1,4 $TSV | sed 1d | sed "s#^#${NAME}\t#"
done | gzip > 3col.tsv.gz
