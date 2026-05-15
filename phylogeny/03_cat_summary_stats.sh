#!/bin/bash
#SBATCH --chdir=./
#SBATCH --job-name=sumstats
#SBATCH --nodes=1 --ntasks=2
#SBATCH --output=_stats_out
#SBATCH --error=_stats_error
#SBATCH --partition nocona
#SBATCH --mem-per-cpu=32G
#SBATCH --time=4:00:00

cd /lustre/scratch/sboyane/camphybrid/08_phylo/windows/stats

# add headers for stats files
grep 'pop1' scaffold0001__1__50000__stats.txt > ../combined_sumstats/window_50kbp_heterozygosity.txt
grep 'pop1' scaffold0001__1__50000__stats.txt  > ../combined_sumstats/window_50kbp_fst.txt
grep 'pop1' scaffold0001__1__50000__stats.txt  > ../combined_sumstats/window_50kbp_Dxy.txt
grep 'pop1' scaffold0001__1__50000__stats.txt  > ../combined_sumstats/window_50kbp_Tajima.txt
grep 'pop1' scaffold0001__1__50000__stats.txt  > ../combined_sumstats/window_50kbp_theta.txt
grep 'pop1' scaffold0001__1__50000__stats.txt  > ../combined_sumstats/window_50kbp_pi.txt

# pull out only the relevant stat for each file
for i in $( ls *stats.txt ); do grep 'heterozygosity' $i >> ../combined_sumstats/window_50kbp_heterozygosity.txt; done
for i in $( ls *stats.txt ); do grep 'Fst' $i >> ../combined_sumstats/window_50kbp_fst.txt; done
for i in $( ls *stats.txt ); do grep 'Tajima_D' $i >> ../combined_sumstats/window_50kbp_Tajima.txt; done
for i in $( ls *stats.txt ); do grep 'Dxy' $i >> ../combined_sumstats/window_50kbp_Dxy.txt; done
for i in $( ls *stats.txt ); do grep 'theta' $i >> ../combined_sumstats/window_50kbp_theta.txt; done
for i in $( ls *stats.txt ); do grep -w 'pi' $i >> ../combined_sumstats/window_50kbp_pi.txt; done
