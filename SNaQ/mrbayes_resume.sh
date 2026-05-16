#!/bin/bash
#SBATCH --chdir=/lustre/scratch/sboyane/camphybrid/11_mrbayes/windows
#SBATCH --job-name=mb_resume_incomplete
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --partition=nocona
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=32G
#SBATCH --array=1-427

module load gcc/14.2.0

WIN_DIR=/lustre/scratch/sboyane/camphybrid/11_mrbayes/windows
LIST=${WIN_DIR}/incomplete_prefixes.txt

# Get the prefix for this array index
prefix=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$LIST")

nex_file=${WIN_DIR}/${prefix}.nex
ckp_file=${WIN_DIR}/${prefix}.nex.ckp

echo "Array task ${SLURM_ARRAY_TASK_ID}: prefix=${prefix}"

if [[ -f "${nex_file}" && -f "${ckp_file}" ]]; then
    echo "  Found NEX + checkpoint. Resuming MrBayes on ${nex_file}"
    /home/sboyane/anaconda3/envs/mrbayes/bin/mb "${nex_file}"
else
    echo "  Missing ${nex_file} or ${ckp_file} — skipping"
fi
