#!/usr/bin/env bash
# Extract email subject from dataset

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT=$DIR/output_subject

cd Dataset

for i in * ; do
    # echo "$i"
    cd "$DIR/Dataset/$i"
    for j in * ; do
        # echo "$OUTPUT/$i/$j"
        echo $j
        LINE=$(cat $j | sed -n -e 's/^Subject: //p')
        if grep -q "Re: " <<< "$LINE" ; then
            echo $LINE | sed -n -e 's/^Re: //p' > "$OUTPUT/$i/$j"
        else
            echo $LINE > "$OUTPUT/$i/$j"
        fi
    done
done