#!/bin/bash

in_fn=${1}
out_fn=${2}

slurm_partition=queue0
slurm_cpus_per_task=1
slurm_mem_per_cpu="25G"
slurm_ntasks=1

slurm_job_name="convert_bed12"
slurm_out=${PWD}/${slurm_job_name}.out
slurm_err=${PWD}/${slurm_job_name}.err

echo "in_fn  | ${in_fn}"
echo "out_fn | ${out_fn}"

sbatch \
    --partition=${slurm_partition} \
    --cpus-per-task=${slurm_cpus_per_task} \
    --ntasks=${slurm_ntasks} \
    --mem-per-cpu=${slurm_mem_per_cpu} \
    --job-name=${slurm_job_name} \
    -o ${slurm_out} \
    -e ${slurm_err} \
    ${PWD}/sam_to_bam.slurm.sh ${in_fn} ${out_fn}

