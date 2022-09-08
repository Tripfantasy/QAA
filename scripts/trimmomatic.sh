#!/bin/bash
#SBATCH --account=bgmp         ### SLURM account which will be charged for the job
#SBATCH --job-name=Trimmomatic    ### Job Name
#SBATCH --output=Trimmomatic_%j.out         ### File in which to store job output
#SBATCH --error=Trimmomatic-%j.err          ### File in which to store job error messages
#SBATCH --time=0-24:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Node count required for the job
#SBATCH --cpus-per-task=4   ### Number of cpus (cores) per task
#SBATCH --partition=bgmp          ### partition to run things

cd /projects/bgmp/dmarro/bioinfo/Bi623/assignments/FastQC/QAA
conda activate QAA

/usr/bin/time -v trimmomatic PE trimmed_2_2B_control_S2_L008_R1_001.fastq trimmed_2_2B_control_S2_L008_R2_001.fastq control_filtered1P.fq.gz control_filtered1U.fq.gz contol_filtered2P.fq.gz control_filtered2U.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

/usr/bin/time -v trimmomatic PE trimmed_Undetermined_S0_L008_R1_001.fastq trimmed_Undetermined_S0_L008_R2_001.fastq undetermined_filtered1P.fq.gz undetermined_filtered1U.fq.gz undetermined_filtered2P.fq.gz undetermined_filtered2U.gq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35