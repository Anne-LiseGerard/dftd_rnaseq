#!/bin/bash

# get genome
wget https://ftp.ensembl.org/pub/release-109/fasta/sarcophilus_harrisii/dna/Sarcophilus_harrisii.mSarHar1.11.dna.toplevel.fa.gz
# get annotation
wget https://ftp.ensembl.org/pub/release-109/gtf/sarcophilus_harrisii/Sarcophilus_harrisii.mSarHar1.11.109.gtf.gz
# rename
mv Sarcophilus_harrisii.mSarHar1.11.dna.toplevel.fa.gz mSarHar1.11.fa.gz
mv Sarcophilus_harrisii.mSarHar1.11.109.gtf.gz mSarHar1.11.gtf.gz
#  unzip
gunzip mSarHar1.11*
