#!/bin/bash

# Dossiers cibles
DIRS=("$HOME/Documents" "$HOME/Downloads")

for DIR in "${DIRS[@]}"; do
    find "$DIR" -type f -name "* *" | while IFS= read -r file; do
        new_name="$(dirname "$file")/$(basename "$file" | tr ' ' '_')"
        mv -n "$file" "$new_name"
    done
done


