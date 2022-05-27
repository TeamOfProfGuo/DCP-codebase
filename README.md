# Few-shot Segmentation Experiments

Adopted from [**DCP**](https://github.com/chunbolang/DCP).

## Requisites
- Test Env: Python 3.9.7 (Singularity)
- Packages:
    - torch (1.10.2+cu113), torchvision (0.11.3+cu113)
    - numpy, scipy, pandas, tensorboardX, cv2
    - networkx, scikit-image
```shell
# copy the environment on Greene (never do this on a login node)
cp /scratch/hl3797/overlay-25GB-500K.ext3 /scratch/$USER
cp /scratch/hl3797/cuda11.4.2-cudnn8.2.4-devel-ubuntu20.04.3.sif /scratch/$USER
```

## Clone codebase
```shell
# default working dir: /scratch/$USER
git clone https://github.com/TeamOfProfGuo/DCP-codebase && cd DCP-codebase
```

## Preparation

### Pascal-5i dataset
**Note:** Make sure the path in `misc/prepare_dataset.sh` works for you.
```shell
sh misc/prepare_dataset.sh
```

### Pretrained models
Download via <a href="https://drive.google.com/file/d/1rMPedZBKFXiWwRX3OHttvKuD1h9QRDbU/view?usp=sharing" target="_blank">this link</a>, and transfer the zip file to your project root on Greene.
```
unzip initmodel.zip
```

### Config files
Modify the `data_root` in the `.yaml` files under `config/`.

---

## Run experiment
**Note:** Modify the path in slurm scripts (as needed) before you start.
```
sbatch train.slurm pascal split0 DCP resnet50
```




