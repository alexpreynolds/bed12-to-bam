#!/bin/bash

in_fn=${1}
out_fn=${2}

module add bedops

sort-bed ${in_fn} | awk -v FS="\t" -v OFS="\t" '{ \
  if ($4 == "") $4 = "."; \
  if ($5 == "") $5 = "."; \
  if ($6 == "") $6 = "."; \
  if ($7 == "") $7 = "."; \
  if ($8 == "") $8 = "."; \
  if ($9 == "") $9 = "."; \
  if ($10 == "") $10 = 1; \
  if ($11 == "") $11 = $3 - $2; \
  if ($12 == "") $12 = 0; \
	print $1, $2, $3, $4, $5, $6, $7, $8, $9, 1, ($3-$2), 0; \
}' > ${out_fn}
