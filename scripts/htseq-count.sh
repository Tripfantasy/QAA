#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --job-name=count
#SBATCH --time=0-05:00:00

cd /projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA/alignment
conda activate QAA
/usr/bin/time -v htseq-count -f sam control.out.sam Mus_musculus.GRCm39.107.gtf --stranded=reverse > control_htseqR.txt
