#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=filter
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --partition=quanah
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-31

# Prepend bcftools path to PATH
source activate vcftools


# define main working directory
workdir=/lustre/scratch/sboyane/camphybrid

# define variables
region_array=$( head -n${SLURM_ARRAY_TASK_ID} ${workdir}/scaffolds.txt | tail -n1 )


# run vcftools with SNP and invariant site output, 20% max missing data, no indels
#for phylogeny and observed heterozygosity remove outgroup
 vcftools --vcf ${workdir}/04_vcf/${region_array}.vcf --keep keeplist_phylogeny.txt --max-missing 0.8 \
 --max-alleles 2  --remove-indels --recode --recode-INFO-all  \
 --out ${workdir}/08_phylo/${region_array}
 
# compress files with bgzip and index with tabix
bgzip ${workdir}/08_phylo/${region_array}.recode.vcf
tabix ${workdir}/08_phylo/${region_array}.recode.vcf.gz



