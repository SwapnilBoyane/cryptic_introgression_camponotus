#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=twisst
#SBATCH --nodes=1 --ntasks=4
#SBATCH --partition nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=32G

cd /lustre/scratch/sboyane/camphybrid/08_twisst

#gzip camphybrid_twisst.trees.gz

 python /home/sboyane/twisst/twisst.py -t camphybrid_twisst.trees.gz -w output7taxa.weights.csv.gz \
 --outputTopos output_7taxatopologies.trees -g modoc_southeast -g modoc_west -g modoc_northeast -g hybrid_mod -g herculeanus \
 -g novaeboracensis -g nova_lin -g new --outgroup new \
 --method complete --groupsFile twisst_group_7taxa.txt


 python /home/sboyane/twisst/twisst.py -t camphybrid_twisst.trees.gz -w output5taxa.weights.csv.gz \
 --outputTopos output_5taxatopologies.trees -g modoc -g hybrid_mod -g herculeanus \
 -g novaeboracensis -g nova_lin -g new --outgroup new \
 --method complete --groupsFile twisst_group_5taxa.txt
