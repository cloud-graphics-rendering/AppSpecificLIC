echo "STK spruning model: lambda 0.01"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/spruning --lambda 0.01 --load_weights "./checkpoint/spruning/2400.ckpt"
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/2400.ckpt
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/supertuxkart_spruning_lambda0.01.ckpt

echo "STK spruning model: lambda 0.004"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/spruning --lambda 0.004 --load_weights "./checkpoint/spruning/2400.ckpt"
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/2400.ckpt
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/supertuxkart_spruning_lambda0.004.ckpt

echo "STK spruning model: lambda 0.002"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/spruning --lambda 0.002 --load_weights "./checkpoint/spruning/2400.ckpt"
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/2400.ckpt
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/supertuxkart_spruning_lambda0.002.ckpt

echo "STK spruning model: lambda 0.001"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/spruning --lambda 0.001 --load_weights "./checkpoint/spruning/2400.ckpt"
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/2400.ckpt
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/supertuxkart_spruning_lambda0.001.ckpt

echo "STK spruning model: lambda 0.0005"
CUDA_VISIBLE_DEVICES=0 python3 train.py train --batchsize 8 --model_size 1 --train_glob "../../datasets/GameImage_dataset/train/supertuxkart*/*.png" --checkpoint_dir checkpoint/spruning --lambda 0.0005 --load_weights "./checkpoint/spruning/2400.ckpt"
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/2400.ckpt
cp ./checkpoint/spruning/2500.ckpt ./checkpoint/spruning/supertuxkart_spruning_lambda0.0005.ckpt

