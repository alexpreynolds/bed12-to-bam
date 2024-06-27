SHELL=/bin/bash

#LOCAL_PREFIX=repeats_for_fiberscope.sorted
LOCAL_PREFIX=AG90658.interval.all.fps.0.01
LOCAL_BED=${PWD}/${LOCAL_PREFIX}.bed
LOCAL_BED12=${PWD}/${LOCAL_PREFIX}.bed12
LOCAL_SAM=${PWD}/${LOCAL_PREFIX}.sam
LOCAL_BAM=${PWD}/${LOCAL_PREFIX}.bam

DEFAULT_RGB=0,0,0

AWS_S3_PATH=s3://areynolds-us-west-2/cd3plus/052524/generic-bam

all:

convert_local_to_bed12:
	${PWD}/convert.sh ${LOCAL_BED} ${LOCAL_BED12}

convert_bed12_to_sam:
	${PWD}/bed12_to_sam.py ${LOCAL_BED12} ${LOCAL_SAM} ${DEFAULT_RGB}

convert_sam_to_bam:
	${PWD}/sam_to_bam.sh ${LOCAL_SAM} ${LOCAL_BAM}

upload_dryrun:
	aws s3 cp --dryrun . ${AWS_S3_PATH} --recursive --exclude "*" --include "${LOCAL_PREFIX}.bam"
	aws s3 cp --dryrun . ${AWS_S3_PATH} --recursive --exclude "*" --include "${LOCAL_PREFIX}.bam.bai"

upload_real:
	aws s3 cp . ${AWS_S3_PATH} --recursive --exclude "*" --include "${LOCAL_PREFIX}.bam"
	aws s3 cp . ${AWS_S3_PATH} --recursive --exclude "*" --include "${LOCAL_PREFIX}.bam.bai"
