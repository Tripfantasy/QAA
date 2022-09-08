#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --job-name=STAR
#SBATCH --time=0-00:30:00

genome_Dir=/projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA/Mus.musculus.GRCm39.107.STAR/
R1_file=/projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA/undetermined_filtered1P.fq.gz
R2_file=/projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA/undetermined_filtered2P.fq.gz

/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $R1_file $R2_file \
--genomeDir $genome_Dir \
--outFileNamePrefix alignment/