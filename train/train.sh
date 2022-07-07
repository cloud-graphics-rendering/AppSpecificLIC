echo "small model: lambda 0.004"
cp ./checkpoint/small_dota2_lambda0.16.ckpt ./checkpoint/1500.ckpt

CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.004 --load_weights "./checkpoint/1500.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.004.ckpt

echo "small model: lambda 0.04"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.04 --load_weights "./checkpoint/small/2000.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.04.ckpt

echo "small model: lambda 0.02"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.02 --load_weights "./checkpoint/small/2000.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.02.ckpt

echo "small model: lambda 0.01"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.01 --load_weights "./checkpoint/small/2000.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.01.ckpt

echo "small model: lambda 0.002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.002 --load_weights "./checkpoint/small/2000.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.002.ckpt

echo "small model: lambda 0.001"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.001 --load_weights "./checkpoint/small/2000.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.001.ckpt

echo "small model: lambda 0.0005"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.0005 --load_weights "./checkpoint/small/2000.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.0005.ckpt

echo "small model: lambda 0.0002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.0002 --load_weights "./checkpoint/small/2000.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.0002.ckpt

echo "small model: lambda 0.0001"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/small --lambda 0.0001 --load_weights "./checkpoint/small/2000.ckpt"
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/2000.ckpt
cp ./checkpoint/small/2500.ckpt ./checkpoint/small/redeclipse_lambda0.0001.ckpt



echo "xsmall model: lambda 0.004"
cp ./checkpoint/xsmall_dota2_lambda0.16.ckpt ./checkpoint/1500.ckpt

CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 0 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.004 --load_weights "./checkpoint/1500.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.004.ckpt

echo "xsmall model: lambda 0.04"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 0 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.04 --load_weights "./checkpoint/xsmall/2000.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.04.ckpt

echo "xsmall model: lambda 0.02"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 0 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.02 --load_weights "./checkpoint/xsmall/2000.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.02.ckpt

echo "xsmall model: lambda 0.01"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 0 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.01 --load_weights "./checkpoint/xsmall/2000.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.01.ckpt

echo "xsmall model: lambda 0.002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 0 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.002 --load_weights "./checkpoint/xsmall/2000.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.002.ckpt

echo "xsmall model: lambda 0.001"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 0 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.001 --load_weights "./checkpoint/xsmall/2000.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.001.ckpt

echo "xsmall model: lambda 0.0005"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.0005 --load_weights "./checkpoint/xsmall/2000.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.0005.ckpt

echo "xsmall model: lambda 0.0002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.0002 --load_weights "./checkpoint/xsmall/2000.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.0002.ckpt

echo "xsmall model: lambda 0.0001"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/xsmall --lambda 0.0001 --load_weights "./checkpoint/xsmall/2000.ckpt"
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/2000.ckpt
cp ./checkpoint/xsmall/2500.ckpt ./checkpoint/xsmall/redeclipse_lambda0.0001.ckpt


echo "median model: lambda 0.004"
cp ./checkpoint/median_dota2_lambda0.16.ckpt ./checkpoint/1500.ckpt

CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.004 --load_weights "./checkpoint/1500.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.004.ckpt

echo "median model: lambda 0.04"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.04 --load_weights "./checkpoint/median/2000.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.04.ckpt

echo "median model: lambda 0.02"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.02 --load_weights "./checkpoint/median/2000.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.02.ckpt

echo "median model: lambda 0.01"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.01 --load_weights "./checkpoint/median/2000.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.01.ckpt

echo "median model: lambda 0.002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.002 --load_weights "./checkpoint/median/2000.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.002.ckpt

echo "median model: lambda 0.001"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.001 --load_weights "./checkpoint/median/2000.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.001.ckpt

echo "median model: lambda 0.0005"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.0005 --load_weights "./checkpoint/median/2000.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.0005.ckpt

echo "median model: lambda 0.0002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.0002 --load_weights "./checkpoint/median/2000.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.0002.ckpt

echo "median model: lambda 0.0001"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 2 --train_glob "../../datasets/GameImage_dataset/train/redeclipse*/*.png" --checkpoint_dir checkpoint/median --lambda 0.0001 --load_weights "./checkpoint/median/2000.ckpt"
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/2000.ckpt
cp ./checkpoint/median/2500.ckpt ./checkpoint/median/redeclipse_lambda0.0001.ckpt
