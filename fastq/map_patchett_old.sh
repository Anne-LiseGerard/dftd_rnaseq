#!/bin/bash

# set the ref sequence
REF=Sarcophilus_harrisii.DEVIL7.0.cdna+ncrna.fa.gz.idx


for FQZ1 in *.fastq.gz ; do

  skewer -q 10 -t 10 $FQZ1 

  FQ1=$(echo $FQZ1 | sed 's#.gz$#-trimmed.fastq#')

  kallisto quant \
  -i $REF \
  -o ${FQ1}_kal -t 10 $FQ1 \
  --single \
  -l 100 \
  -s 10

  rm $FQ1 

done


for TSV in */abundance.tsv ; do
  NAME=$(echo $TSV | cut -d '_' -f1) ; cut -f1,4 $TSV | sed 1d | sed "s#^#${NAME}\t#"
done | gzip > 3col.tsv.gz
