#!/usr/bin/env bash

set -euo pipefail

# 1. Ensure at least one argument was provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <file1> <file2> ... <fileN>"
    exit 1
fi

FILES=("$@")

# 2. Validate that all files exist in the current directory
for file in "${FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' does not exist in $(pwd)"
        exit 1
    fi
done

# 3. Identify the executable (.exe)
exe_files=()
for file in "${FILES[@]}"; do
    if [[ "$file" == *.exe ]]; then
        exe_files+=("$file")
    fi
done

if [ "${#exe_files[@]}" -ne 1 ]; then
    echo "Error: Exactly one .exe file must be provided. Found ${#exe_files[@]}"
    exit 1
fi

exe="${exe_files[0]}"
exe_name="${exe%.exe}"

# 4. Create directory in Local/AppData equivalent
target_dir="$HOME/.local/share/$exe_name"

mkdir -p "$target_dir"

# 5. Copy all files into the new directory
for file in "${FILES[@]}"; do
    cp -f "$file" "$target_dir/"
done

echo "Copied ${#FILES[@]} files to $target_dir"