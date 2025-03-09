#!/bin/bash

# calculate mean coverage across genome (CAll) and across deletions (CDel)
# calculate tumour purity (rho) as CDel/CAll

touch tumour_purity.txt

for BAM in *-sorted.bam ; do

 PREFIX=`echo $BAM | cut -c1-10`
 echo 'sample no '$PREFIX >> tumour_purity.txt 

 CALLFILE=$PREFIX'-CAll.txt'
 CDELFILE=$PREFIX'-CDel.txt'

 CALL=`awk '{ sum += $7 } END { print sum / NR }' $CALLFILE`
 CDEL=`awk '{ sum += $7 } END { print sum / NR }' $CDELFILE`

 echo 'CAll '$CALL >> tumour_purity.txt
 echo 'CDel '$CDEL >> tumour_purity.txt

 PURITY=`echo "scale = 3; ($CDEL / $CALL)" | bc`
 echo 'rho '$PURITY >> tumour_purity.txt
 
done
