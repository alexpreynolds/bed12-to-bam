SHELL=/bin/bash
LOCAL_PREFIX=repeats_for_fiberscope.sorted
LOCAL_BED=${PWD}/${LOCAL_PREFIX}.bed
LOCAL_BED12=${PWD}/${LOCAL_PREFIX}.bed12
LOCAL_SAM=${PWD}/${LOCAL_PREFIX}.sam
LOCAL_BAM=${PWD}/${LOCAL_PREFIX}.bam

all:

convert_local_to_bed12:
	${PWD}/convert.sh ${LOCAL_BED} ${LOCAL_BED12}

convert_bed12_to_sam:
	${PWD}/bed12_to_sam.py ${LOCAL_BED12} ${LOCAL_SAM}

convert_sam_to_bam:
	${PWD}/sam_to_bam.sh ${LOCAL_SAM} ${LOCAL_BAM}
