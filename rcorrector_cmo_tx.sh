#!/bin/bash
## Job Name
#SBATCH --account=def-nagissa
#SBATCH --job-name=rcorrector_CMO2024_tx
#SBATCH --array=1-66%30
#SBATCH --time=01:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=10
#SBATCH --mail-user=jwinter2@uw.edu
#SBATCH --mail-type=ALL

# load modules
module load apptainer
module load jellyfish

# get list of samples for job
sample=$(sed -n "${SLURM_ARRAY_TASK_ID}p" samplenames.txt)

# print sample number
echo "Processing sample: ${sample} index: ${SLURM_ARRAY_TASK_ID}"

# set path to jellyfish
JELLY_PATH=$(dirname $(which jellyfish))

# make sure permissions are set for all the files
# example: chmod +x /home/jwinter/scratch/20250826-CMO-tx/trimmed/paired/rcorrector

# run rcorrector
apptainer exec -B /cvmfs/soft.computecanada.ca -B /home/jwinter/scratch/ --env PATH="${JELLY_PATH}:/usr/bin:/bin:/usr/local/bin" rcorrector_latest.sif perl /home/jwinter/scratch/20250826-CMO-tx/trimmed/paired/rcorrector/run_rcorrector.pl -1 ${sample}_1_out_paired.fq.gz -2 ${sample}_2_out_paired.fq.gz -t 10 -od rcorrector_out