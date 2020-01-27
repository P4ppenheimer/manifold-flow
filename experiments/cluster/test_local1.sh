#!/usr/bin/env bash

source activate ml
basedir=/Users/johannbrehmer/work/projects/manifold_flow/manifold-flow
cd $basedir/experiments

python -u train.py --modelname debug_ged_largebs --dataset spherical_gaussian --algorithm gamf --ged --epsilon 0.001 --genbatchsize 2000 --samplesize 10000 --dir $basedir
