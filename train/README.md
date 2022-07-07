## Train a Coarse-to-Fine Compression Model

### Data
We use DIV2K as the training data. All 800 images are included. Besides, we down-sampled all images to half of their sizes and build a training set with 1600 images.

You may place the 1600 PNG files in a directory, assumed to be named ```IMAGE_PATH```.

### Command
An example command to train the network with 2 GPUs is as follows,

```CUDA_VISIBLE_DEVICES=0,1 python train.py train --batchsize 16 --train_glob "IMAGE_PATH/*.png" --checkpoint_dir checkpoint --lambda 0.004```
```CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint --lambda 0.16 --load_weights "./checkpoint/1600.ckpt```

For GameImage_dataset, you can train all the images or train the applications one by one:
Train all the images: "IMAGE_PATH/GameImage_dataset/train/*/*.png"
Train individual app with 720p  image: "IMAGE_PATH/GameImage_dataset/train/supertuxkart-720p/*.png"
Train individual app with 1080p image: "IMAGE_PATH/GameImage_dataset/train/supertuxkart-108p/*.png"
Train individual app (720p and 1080p): "IMAGE_PATH/GameImage_dataset/train/supertuxkart*/*.png"

The above shows an example of supertuxkart.
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 16 --train_glob "/home/tianyiliu/Documents/ai-encoding/related-projects/datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint --lambda 0.004

You may use different numbers of GPUs. Please modify ```n_parallel``` in the code if you use a different number of GPUs.

The training checkpoints will be saved in ```checkpoint``` as set.

If your training process is interrupted, you can continue from a specific checkpoint.
```--load_weights "./checkpoint/xxx.ckpt"```

Note that this is an experimental implementation of the training procedure with PyTorch. The code would train the model from scratch (without pretraining) and the resulting models would even achieve better R-D performance than released in the paper. If you encounter any problem, please feel free to contact me.
