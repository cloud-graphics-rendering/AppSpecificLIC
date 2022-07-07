echo "mpruning model: lambda 0.01"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/dota2*/*.png" --checkpoint_dir checkpoint/mpruning --lambda 0.01 --load_weights "./checkpoint/mpruning/2000.ckpt"
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/2400.ckpt
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/dota2_lambda0.01.ckpt

echo "mpruning model: lambda 0.004"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/dota2*/*.png" --checkpoint_dir checkpoint/mpruning --lambda 0.004 --load_weights "./checkpoint/mpruning/2400.ckpt"
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/2400.ckpt
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/dota2_lambda0.004.ckpt

echo "mpruning model: lambda 0.002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/dota2*/*.png" --checkpoint_dir checkpoint/mpruning --lambda 0.002 --load_weights "./checkpoint/mpruning/2400.ckpt"
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/2400.ckpt
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/dota2_lambda0.002.ckpt

echo "mpruning model: lambda 0.001"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/dota2*/*.png" --checkpoint_dir checkpoint/mpruning --lambda 0.001 --load_weights "./checkpoint/mpruning/2400.ckpt"
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/2400.ckpt
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/dota2_lambda0.001.ckpt

echo "mpruning model: lambda 0.0005"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/dota2*/*.png" --checkpoint_dir checkpoint/mpruning --lambda 0.0005 --load_weights "./checkpoint/mpruning/2400.ckpt"
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/2400.ckpt
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/dota2_lambda0.0005.ckpt

echo "mpruning model: lambda 0.0002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/dota2*/*.png" --checkpoint_dir checkpoint/mpruning --lambda 0.0002 --load_weights "./checkpoint/mpruning/2400.ckpt"
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/2400.ckpt
cp ./checkpoint/mpruning/2500.ckpt ./checkpoint/mpruning/dota2_lambda0.0002.ckpt
