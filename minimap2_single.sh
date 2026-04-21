#!/bin/bash
## Job Name
#SBATCH --account=def-nagissa
#SBATCH --job-name=minimap_CMO2024_tx
#SBATCH --array=1-66%30
#SBATCH --time=05:00:00
#SBATCH --mem=24G
#SBATCH --cpus-per-task=8
#SBATCH --mail-user=jwinter2@uw.edu
#SBATCH --mail-type=ALL

#load minimap

module load minimap2
module load samtools

#get list of samples
sample=$(sed -n "${SLURM_ARRAY_TASK_ID}p" ../samplenames/samplenames.txt)

minimap2 -ax splice:sr ../rnaspades/spades_single_assembly/spades_out_${sample}/transcripts.fasta ../clean_fastq/${sample}_clean_1.fastq.gz ../clean_fastq/${sample}_clean_2.fastq.gz > single_assembly/${sample}.sam

samtools view -uS single_assembly/${sample}.sam | samtools sort -@8 -m 2G -o single_assembly/${sample}.sorted.bam - && samtools index single_assembly/${sample}.sorted.bam

samtools stats single_assembly/${sample}.sorted.bam > single_assembly/${sample}.sorted.stats

rm single_assembly/${sample}.sam