#!/bin/bash

# modify the path if needed
data_dir=/scratch/$USER/data
if [ ! -d $data_dir ]; then
    mkdir $data_dir
fi

# prepare [PASCAL VOC 2012] dataset
cd $data_dir
if [ ! -d './VOCdevkit2012' ]; then
    wget http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar
    tar -xvf VOCtrainval_11-May-2012.tar
    mv VOCdevkit VOCdevkit2012
fi

# prepare [SBD] dataset
cd ./VOCdevkit2012/VOC2012
if [ ! -d './SegmentationClassAug' ]; then
    wget https://github.com/TeamOfProfGuo/Codebase-Files/raw/main/SegmentationClassAug.zip
    unzip SegmentationClassAug.zip
fi