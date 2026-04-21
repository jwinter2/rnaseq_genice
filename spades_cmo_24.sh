#!/bin/bash
## Job Name
#SBATCH --account=def-nagissa
#SBATCH --job-name=spades_CMO2024_tx
#SBATCH --array=1-66%30
#SBATCH --time=05:00:00
#SBATCH --mem=250G
#SBATCH --cpus-per-task=32
#SBATCH --mail-user=jwinter2@uw.edu
#SBATCH --mail-type=ALL

#load spades

module load spades

#get list of samples for job
sample=$(sed -n "${SLURM_ARRAY_TASK_ID}p" samplenames.txt)

spades.py --rna -1 clean_fastq/normalized/${sample}_norm_1.fastq.gz -2 clean_fastq/normalized/${sample}_norm_2.fastq.gz -o spades_single_assembly/spades_out_${sample}