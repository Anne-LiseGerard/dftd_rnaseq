#!/bin/bash

find . -name "*.gmt" | while read GMT ;
do
  cat "${GMT}" <(echo -e "\r") ;
done | sed '/^[[:space:]]*$/d' > gsea.gmt


