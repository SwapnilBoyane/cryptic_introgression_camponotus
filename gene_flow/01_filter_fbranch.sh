#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=filter
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-31


source activate vcftools

# define main working directory
workdir=/lustre/scratch/sboyane/camphybrid

# define variables
region_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/scaffolds.txt | tail -n1 )


#filter for the gene flow keeping only biallelic snps
 vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep keeplist_fbranch.txt --max-missing 0.9 \
 --min-alleles 2 --max-alleles 2 --mac 2 --max-maf 0.49 --recode --recode-INFO-all \
 --out ${workdir}/07_gene_flow/${region_array}

