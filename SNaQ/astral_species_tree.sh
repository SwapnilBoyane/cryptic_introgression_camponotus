#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=astral
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=128G


java -jar /lustre/work/sboyane/Astral/astral.5.7.8.jar -i camponotus_mrbayes.trees \
 --namemapfile astral_focal_map.txt -o camponotus_focal_astral.tre 2> camponotus_focal_astral.log



#java -jar /lustre/work/sboyane/Astral/astral.5.7.8.jar -i camponotus_mrbayes.trees \
# -o camponotus_focal_inds_astral.tre 2> camponotus_focal_inds_astral.log
