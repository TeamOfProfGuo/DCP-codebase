#!/bin/bash

#SBATCH --job-name=fs-seg
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=24:00:00
#SBATCH --gres=gpu

# training config
dataset=$1
exp_name=$2
arch=$3
net=$4

# build exp dir
config_path=config/${dataset}/${dataset}_${exp_name}_${net}.yaml
exp_dir=exp/${dataset}/${exp_name}_${arch}_${net}
mkdir -p exp/${dataset}/${exp_name}_${arch}_${net}
cp ${config_path} ${exp_dir}
echo 'config_path: '${config_path}
echo 'exp_dir: '${exp_dir}

# Singularity path
ext3_path=/scratch/$USER/overlay-25GB-500K.ext3
sif_path=/scratch/$USER/cuda11.4.2-cudnn8.2.4-devel-ubuntu20.04.3.sif

# start running
now=$(date +"%Y%m%d_%H%M%S")
singularity exec --nv --overlay ${ext3_path}:ro ${sif_path} \
/bin/bash -c "
source /ext3/env.sh
cd /scratch/$USER/DCP-codebase
python train.py --config=${config_path} --arch=${arch} > ${exp_dir}/output-${now}.log 2>&1
"