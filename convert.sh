#!/bin/bash

in_fn=${1}
out_fn=${2}

awk -v FS="\t" -v OFS="\t" '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, 1, ($3-$2), 0;}' ${in_fn} > ${out_fn}
