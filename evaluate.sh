#!/bin/bash
############################################################
# Help                                                     #
############################################################
usage()
{
   # Display Usage
   echo "Usage: $0 [-n <string>] [-m <string>] [-t <string>] [-o <string>] [-s <3/2/1/0>]"

   echo "Evaluate compression efficiency in TWO ways:"
   echo "(1)Test single image with single model or (2)Test all the images with all the models in standard GamingImage Datasets"
   echo "How to use:"
   echo "(1)Example: $0 -m \"./models/small/supertuxkart_lambda0.01.ckpt\" -t \"../datasets/GameImage_dataset/test/supertuxkart-720p/105.png\" -s 1"
   echo "(2)Example: $0 -n supertuxkart/0ad/redeclipse/dota2/inmind/imhotep -s 3/2/1/0"
   echo
   echo "options:"
   echo "-n     game name. If we only input game name, then, -m -t -o would have default values."
   echo "-m     model path and name in GLOB patterns. e.g., ./models/stk*"
   echo "-t     testing data path and name in GLOB patterns."
   echo "-o     output path is a directory, and each model would generate an csv file."
   echo "-s     model size(3: large, 2: median, 1: small, 0: xsmall), default model size is 3:large"
   echo "-h     Print this message and exit."
   echo
   exit 1
}


############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options

while getopts "hn:m:t:o:s:" flag
do
    case "${flag}" in
        n) gamename=${OPTARG};;
        m) modelpath=${OPTARG};;
        t) test_file=${OPTARG};;
        o) outputpath=${OPTARG};;
        s) sizeofmodel=${OPTARG};;
	*) usage;;
    esac
done

# large, median, small, xsmall
model_size=""
if [ "${sizeofmodel}" = "0" ]; then
	model_size="xsmall"
elif [ "${sizeofmodel}" = "1" ]; then
	model_size="small"
elif [ "${sizeofmodel}" = "2" ]; then
	model_size="median"
else
	model_size="large"
fi

outputpath="./"
if [ -n "${gamename}" ]; then
	if [ -z "${modelpath}" ]; then
		modelpath="./models/${model_size}/${gamename}*"
	fi
	if [ -z "${test_file}" ]; then
		#test_file="../datasets/GameImage_dataset/test/${gamename}*/*.png"
		test_file="default"
	fi
	if [ -z "${outputpath}" ]; then
		outputpath="./results/${gamename}"
	fi
elif [ -z "${modelpath}" ] || [ -z "${test_file}" ] || [ -z "${model_size}" ]; then
	usage
else
	gamename="default"
fi

[ -e ${outputpath} ] || mkdir -p ${outputpath}

echo "Gamename: $gamename";
echo "modelpath: $modelpath";
echo "testfile: $test_file";
echo "outputpath: $outputpath";
echo "sizeofmodel: $model_size";


############################################################
############################################################
# Main program                                             #
############################################################
############################################################

echo "model,name,shape,binsize,enc,bpp,dec,psnr,ms_ssim,ms_db" > ${model_size}_${gamename}.csv
echo ${modelpath}
for model_file in ${modelpath}; do
    python3 AppEncDec.py ${gamename} tmp.bin tmp.png ${model_size}_${gamename}.csv --test_file ${test_file} --model_size ${model_size} --device cuda --model_file ${model_file}
done



############################################################
# Output CSV and Plot figure                               #
############################################################
