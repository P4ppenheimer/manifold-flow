#!/bin/bash

#SBATCH --job-name=t-gamf2-lhc
#SBATCH --output=log_train_gamf2_lhc_%a.log
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32GB
#SBATCH --time=7-00:00:00
#SBATCH --gres=gpu:1

module load cuda/10.1.105
source activate ml
export OMP_NUM_THREADS=1
cd /scratch/jb6504/manifold-flow/experiments

python -u train.py --modelname april_wdecay0001 --dataset lhc --algorithm gamf --weightdecay 0.001 --modellatentdim 14 --splinebins 10 --sinkhornfactor 1 -i ${SLURM_ARRAY_TASK_ID}
python -u train.py --modelname april_wdecay001 --dataset lhc --algorithm gamf --weightdecay 0.01 --modellatentdim 14 --splinebins 10 --sinkhornfactor 1 -i ${SLURM_ARRAY_TASK_ID}
python -u train.py --modelname april_wdecay01 --dataset lhc --algorithm gamf --weightdecay 0.1 --modellatentdim 14 --splinebins 10 --sinkhornfactor 1 -i ${SLURM_ARRAY_TASK_ID}

python -u train.py --modelname alternate_april_wdecay0001 --dataset lhc --algorithm gamf --alternate --weightdecay 0.001 --modellatentdim 14 --splinebins 10 --nllfactor 0.1 --sinkhornfactor 1 --subsets 100 -i ${SLURM_ARRAY_TASK_ID}
python -u train.py --modelname alternate_april_wdecay001 --dataset lhc --algorithm gamf --alternate --weightdecay 0.01 --modellatentdim 14 --splinebins 10 --nllfactor 0.1 --sinkhornfactor 1 --subsets 100 -i ${SLURM_ARRAY_TASK_ID}
python -u train.py --modelname alternate_april_wdecay01 --dataset lhc --algorithm gamf --alternate --weightdecay 0.1 --modellatentdim 14 --splinebins 10 --nllfactor 0.1 --sinkhornfactor 1 --subsets 100 -i ${SLURM_ARRAY_TASK_ID}
