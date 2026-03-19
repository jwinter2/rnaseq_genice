#!/bin/bash
## Job Name
#SBATCH --account=def-nagissa
#SBATCH --job-name=fastqc_CMO2024_tx
#SBATCH --array=1-132%30
#SBATCH --time=01:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8
#SBATCH --mail-user=jwinter2@uw.edu
#SBATCH --mail-type=ALL

#load fastqc
module load fastqc

# get list of samples for job
sample=$(sed -n "${SLURM_ARRAY_TASK_ID}p" samplenames.txt)

# Use sample name for log output
exec > fastqc_${sample}.out 2>&1

echo "On sample: $sample"
fastqc ${sample} -o trimmomatic_fastqc