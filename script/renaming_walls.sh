#!/bin/bash

cd /home/user/images/selected_walls/ || exit
files=($(ls -v))
counter=1

for file in "${files[@]}"; do
    new_name=$(printf "%04d" "$counter")
    ext=$(basename $file | cut -d. -f2-)
    mv "$file" "$new_name.$ext"

    ((counter++))
done
