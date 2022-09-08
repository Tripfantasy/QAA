#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --job-name=STAR
#SBATCH --time=0-00:30:00

genome_Dir=/projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA/Mus.musculus.GRCm39.107.STAR
fasta_file=/projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA/Mus_musculus.GRCm39.dna.primary_assembly.fa
GTF_file=/projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA/Mus_musculus.GRCm39.107.gtf

/usr/bin/time -v STAR \
    --runMode genomeGenerate \
    --runThreadN 8 \
    --genomeDir $genome_Dir \
    --genomeFastaFiles $fasta_file
    --sjdbGTFfile $GTF_file





