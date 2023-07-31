#!/bin/bash

find . -name "*.gmt" | while read GMT ;
do
  awk '{ $2=""; sub("  ", " "); print }' "${GMT}" <(echo -e "\r") ;
done | sed '/^[[:space:]]*$/d' > gsea.gmt

