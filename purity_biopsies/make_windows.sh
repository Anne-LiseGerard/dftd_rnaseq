#!/bin/bash

# index genome
samtools faidx mSarHar1.11.fa > mSarHar1.11.fa.fai
# make bedtools genome file
cut -f-2 mSarHar1.11.fa.fai > mSarHar1.11.fa.g
# only keep chromosomes 1 to 6
head -n 6 mSarHar1.11.fa.g > mSarHar1.11.1to6.g
# make arbitrary 1kb windows across genome
bedtools makewindows -g mSarHar1.11.1to6.g -w 1000 > window_1kb.bed
# get windows across DFT1 deletion
awk -F'\t' '$1 == 3 && $2 >= 192000000 && $2 <= 219000000' window_1kb.bed > DFT1del.bed
# get windows across DFT2 deletion
awk -F'\t' '$1 == 5 && $2 >= 141000000 && $2 <= 176000000' window_1kb.bed > DFT2del.bed
