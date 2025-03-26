#!/bin/bash -l
#SBATCH --no-requeue
#SBATCH -N 1
#SBATCH -J namd
#SBATCH -o stdout
#SBATCH -e stderr
#SBATCH --exclusive
#SBATCH -p msys
#SBATCH --gres=gpu:2

module load namd/2.12-multicore

namd2 +p32 sym3/min.conf > min.out
#namd2 +p32 dyn.conf > dyn.out && \
#namd2 +p32 min1.conf > min1.out && \
#namd2 +p32 dyn1.conf > dyn1.out
#namd2 +p32 min2.conf > min2.out


# ostatni etap - CUDA:
#module unload namd
#module load namd/2.12-ibverbs-smp-CUDA
#namd2 +idlepoll +p32 final.conf > final.out

# opcjonalnie - skrypty analityczne
# module unload namd/2.12-ibverbs-smp-CUDA
# module load namd/2.12-multicore

# vmd ionized.psf ionized.pdb dyn2.dcd -e rmsd.tcl
# vmd ionized.psf ionized.pdb dyn2.dcd -e energia.tcl
