#!/usr/bin/env bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd Dataset
pwd

for i in * ; do
    # echo "$i"
    cd "$DIR/Dataset/$i"
    for j in * ; do
        # echo "$DIR/output/$i/$j"
        echo $j
        LINE_NUMBER=$(cat $j | grep -m 1 -oP "(?<=^Lines: )[^ ]+") 
        tail $j -n $LINE_NUMBER > "$DIR/output/$i/$j"
    done
done

# ls */*;
