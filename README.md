# Coarse-to-Fine Hyper-Prior Modeling for Learned Image Compressionn
## Update
We add an experimental training code to help developers train their own compression models for a specific range of bit-rate. Please check the ```train/``` sub-directory.
## Overview
This is the implementation of ther paper,
> Yueyu Hu, Wenhan Yang, Jiaying Liu, 
> Coarse-to-Fine Hyper-Prior Modeling for Learned Image Compression,
> <i>AAAI Conference on Artificial Intelligence</i> (<i>AAAI</i>), 2020
 
and also the journal version,

> Yueyu Hu, Wenhan Yang, Zhan Ma, Jiaying Liu,
> Learning End-to-End Lossy Image Compression: A Benchmark,
> <i>IEEE Transactions on Pattern Analysis and Machine Intelligence</i> (<i>TPAMI</i>), 2021.

This is the PyTorch version of Coarse-to-Fine Hyper-Prior Model. The code load and convert weights trained with TensorFlow, originally provided at <a href="https://github.com/huzi96/Coarse2Fine-ImaComp">Coarse2Fine-ImaComp</a>. Besides, this version contains several improvements over the original one:

1. We have a brand new arithmetic coder implementation (in C++). It makes the encoding and decoding significantly faster (~10 times and more).
2. We now have full support of GPU accelerated encoding and decoding. It can be toggled by "--device cuda".
3. Partitioning is implemented, providing the support of compressing and decompressing images in GPUs with limited memory.

# App-Specific LIC in Cloud 3D
Please refer other branch to learn how to set up the environment.

# How to run automatically?
We made some modifications on the original project, and the new code can evaluate all images and all models automatically:

Evaluate single image with single model:
```
./evaluate.sh -t "../datasets/GameImage_dataset/test/supertuxkart-720p/105.png" -p 1
```

Please refer "run.sh" for how to evaluate all images with all models:
```
./run.sh
```
