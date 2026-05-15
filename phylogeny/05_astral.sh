#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=phylo
#SBATCH --nodes=1 --ntasks=8
#SBATCH --partition nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=16G


cd /lustre/scratch/sboyane/camphybrid/08_phylo/windows


java -jar /lustre/work/sboyane/Astral/astral.5.7.8.jar -i camphybrid_introgression.trees -o camphybrid_introgression.tre 2> camphybrid_introgression.log


