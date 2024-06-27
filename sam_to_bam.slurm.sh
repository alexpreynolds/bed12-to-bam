#!/bin/bash

in_fn=${1}
out_fn=${2}

echo "in_fn  | ${in_fn}"
echo "out_fn | ${out_fn}"

if [[ ! -e ${in_fn} ]]
then
    echo "in_fn missing? | ${in_fn}"
fi

module add samtools/1.14

# sort by coordinate
samtools sort ${in_fn} -o ${out_fn}

# index
samtools index ${out_fn} ${out_fn}.bai
