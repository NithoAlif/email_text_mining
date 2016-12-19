#!/usr/bin/env bash
# Extract email body from dataset

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT=$DIR/output

cd Dataset

for i in * ; do
    # echo "$i"
    cd "$DIR/Dataset/$i"
    for j in * ; do
        # echo "$OUTPUT/$i/$j"
        echo $j
        LINE_NUMBER=$(cat $j | grep -m 1 -oP "(?<=^Lines: )[^ ]+") 
        tail $j -n $LINE_NUMBER > "$OUTPUT/$i/$j"
    done
done