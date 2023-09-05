#!/bin/bash

wget https://ftp.ensembl.org/pub/release-101/fasta/sarcophilus_harrisii/ncrna/Sarcophilus_harrisii.DEVIL7.0.ncrna.fa.gz

wget https://ftp.ensembl.org/pub/release-101/fasta/sarcophilus_harrisii/cdna/Sarcophilus_harrisii.DEVIL7.0.cdna.all.fa.gz

cat Sarcophilus_harrisii.DEVIL7.0.cdna.all.fa.gz Sarcophilus_harrisii.DEVIL7.0.ncrna.fa.gz > Sarcophilus_harrisii.DEVIL7.0.cdna+ncrna.fa.gz

kallisto index -i Sarcophilus_harrisii.DEVIL7.0.cdna+ncrna.fa.gz.idx Sarcophilus_harrisii.DEVIL7.0.cdna+ncrna.fa.gz

# gene name curation
zcat < Sarcophilus_harrisii.DEVIL7.0.cdna+ncrna.fa.gz \
| grep '>' | sed 's/>//' | sed 's/ /\t/' \
| sed 's/ gene:/\t/' |  sed 's/gene_symbol:/\t/' \
| cut -f1,3- | sed 's/ /\t/' | cut -f-2,4- \
| sed 's/ /\t/' | cut -f-3 | sed 's/$/\t/' \
| cut -f-3 | sed 's/$/\tNA/' | cut -f-3 > Sarcophilus_harrisii.DEVIL7.0.cdna+ncrna.genenames.tsv

