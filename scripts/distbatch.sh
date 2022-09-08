#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --job-name=dist.py4
#SBATCH --time=0-05:00:00

cd /projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA
conda activate QAA
/usr/bin/time -v ./dist.py \
-f /projects/bgmp/shared/2017_sequencing/demultiplexed/Undetermined_S0_L008_R2_001.fastq.gz -r 14760166 -l 101
