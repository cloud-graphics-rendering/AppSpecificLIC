## Train a App-Specific Learned Image Compression (LIC) Model

### Data
We use <a href="https://utsacloud-my.sharepoint.com/:u:/g/personal/wei_wang_utsa_edu/EROyq4JeQlxLuhWIFD-RFZ8BR69M1fiQk6HhhaoAE_TZnA?e=sTV1o0">Cloud 3D datasets (six gaming image datasets)</a> as the training data. For each application, there are 800 1280x720p images and 800 1920x1080p images are included. There are also 100+100 images for validation, and another 100+100 images for testing.

You may place the Cloud 3D datasets in a directory, assumed to be named ```IMAGE_PATH```.

For Cloud 3D GameImage_dataset, you can train all the images or train the applications one by one:
Train all the images: "IMAGE_PATH/GameImage_dataset/train/*/*.png"
Train individual app with 720p  image: "IMAGE_PATH/GameImage_dataset/train/supertuxkart-720p/*.png"
Train individual app with 1080p image: "IMAGE_PATH/GameImage_dataset/train/supertuxkart-108p/*.png"
Train individual app using 720p and 1080p: "IMAGE_PATH/GameImage_dataset/train/supertuxkart*/*.png"

### Commands:
The below shows an example about how to train supertuxkart small framework from scratch (without pretraining) with different lambdas:
```
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/small --lambda 0.004
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/small --lambda 0.008
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/small --lambda 0.016
```

You can also try large, median, and xsamll framework with "--model_size 3/2/0"
```
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 3 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/large --lambda 0.004
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 3 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/large --lambda 0.008
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 3 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/large --lambda 0.016
```

If you would like train from a specified checkpoint (e.g., 1000.ckpt), you can try:
```
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 3 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/large --lambda 0.16 --load_weights "./checkpoint/large/1000.ckpt
```
Please refer train.sh for more examples.
