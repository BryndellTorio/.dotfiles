#!/bin/bash

generate_unique_filename() {
    local base_name="$1"
    local extension="$2"
    local counter=1
    local new_name="${base_name}.${extension}"

    while [[ -e "$new_name" ]]; do
        new_name="${base_name}_${counter}.${extension}"
        ((counter++))
    done

    echo "$new_name"
}

base_filename="high_quality_color_scan"
extension="png"

output=$(scanimage 2>&1)

if [[ "$output" == *"no SANE devices found"* ]]; then
    echo "No scanner/printer found. Check if scanner/printer is connected."
    exit 1
else
    output_file=$(generate_unique_filename "$base_filename" "$extension")
    scanimage --mode Color --resolution 1200 --format=png > "$output_file"

    echo "File saved as: $output_file"
fi
