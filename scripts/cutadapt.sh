#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --job-name=pwnage
#SBATCH --time=0-05:00:00

cd /projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA
conda activate QAA
/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
    -o trimmed_Undetermined_S0_L008_R1_001.fastq -p trimmed_Undetermined_S0_L008_R2_001.fastq \
    /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R1_001.fastq.gz \
    /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz
