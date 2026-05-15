#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=dsuite
#SBATCH --nodes=2
#SBATCH --ntasks=8
#SBATCH --partition=nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=16G

# combine VCF files

#grep "#" scaffold0031.recode.vcf > camphybrid_ABBA_BABA_gene_flow.vcf

#for i in $( ls scaffold*.recode.vcf ); do grep -v "^#" $i >> camphybrid_ABBA_BABA_gene_flow.vcf; done

# run Dtrios
~/Dsuite/Build/Dsuite Dtrios -t camphybrid_dsuite_final.tre camphybrid_ABBA_BABA_gene_flow.vcf camphybrid_dsuite_final.txt

# run Fbranch
~/Dsuite/Build/Dsuite Fbranch camphybrid_dsuite_final.tre camphybrid_dsuite_final_tree.txt > fbranch_output_final.txt

# plot Fbranch
~/Dsuite/utils/dtools.py fbranch_output_final.txt camphybrid_dsuite_final.tre 
