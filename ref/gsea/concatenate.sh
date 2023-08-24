#!/bin/bash

# Check if there are any .gmt files in the current directory
shopt -s nullglob
gmt_files=( *.gmt )

if [ ${#gmt_files[@]} -eq 0 ]; then
  echo "No .gmt files found in the current directory."
  exit 1
fi

# Concatenate .gmt files with a carriage return in between
output_file="gsea.gmt"

# Remove the output file if it already exists
if [ -e "$output_file" ]; then
  rm "$output_file"
fi

# Loop through each .gmt file and concatenate them
for gmt_file in "${gmt_files[@]}"; do
  cat "$gmt_file" >> "$output_file"
  echo "" >> "$output_file" # Add a carriage return after each file
done

echo "Concatenation completed. Output saved to $output_file."

