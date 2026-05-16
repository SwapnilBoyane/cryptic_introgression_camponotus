#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=mrbayes
#SBATCH --nodes=1 --ntasks=1
#SBATCH --partition nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=32G


module load gcc/14.2.0
module load R/4.4.1


cd /lustre/scratch/sboyane/camphybrid/11_mrbayes/windows

Rscript 05_merge_tree_files.r
