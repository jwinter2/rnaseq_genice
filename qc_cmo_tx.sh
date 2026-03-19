#!/bin/bash
## Job Name
#SBATCH --account=def-nagissa
#SBATCH --job-name=trim_CMO2024_tx
#SBATCH --time=10:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=8
#SBATCH --mail-user=jwinter2@uw.edu
#SBATCH --mail-type=ALL

#load trimmomatic

module load trimmomatic

#loop across each paired set of reads

for R1 in *_1.fq.gz ; do
  R2="${R1%%_1.*}_2.fq.gz"
  java -jar trimmomatic.jar PE -threads 8 \
  "$R1" "$R2" \
  "${R1%%.*}_out_paired.fq.gz" "${R1%%.*}_out_unpaired.fq.gz" \
  "${R2%%.*}_out_paired.fq.gz" "${R2%%.*}_out_unpaired.fq.gz" \
  ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:8:True SLIDINGWINDOW:4:20 LEADING:3 TRAILING:3 MINLEN:36
done