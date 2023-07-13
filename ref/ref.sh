#!/bin/bash

wget https://ftp.ensembl.org/pub/release-109/fasta/sarcophilus_harrisii/ncrna/Sarcophilus_harrisii.mSarHar1.11.ncrna.fa.gz

wget https://ftp.ensembl.org/pub/release-109/fasta/sarcophilus_harrisii/cdna/Sarcophilus_harrisii.mSarHar1.11.cdna.all.fa.gz

cat Sarcophilus_harrisii.mSarHar1.11.cdna.all.fa.gz Sarcophilus_harrisii.mSarHar1.11.ncrna.fa.gz > Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.fa.gz

kallisto index -i Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.fa.gz.idx Sarcophilus_harrisii.mSarHar1.11.cdna+ncrna.fa.gz


