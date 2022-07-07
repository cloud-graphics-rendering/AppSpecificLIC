#!/bin/bash
############################################################
# Help                                                     #
############################################################
usage()
{
   # Display Usage
   echo "Usage: $0 [-n <gamename>] [-m <model path>] [-t <image path for testing>] [-o <output directory>]"

   echo "Evaluate compression efficiency with specified model(s) and test dataset of a specific game."
   echo
   echo "Example: $0 -t \"../datasets/GameImage_dataset/test/supertuxkart-720p/105.png\" -p 1/2/3/4/5/6/7"
   echo "Example: $0 -n supertuxkart/0ad/redeclipse/dota2/inmind/imhotep"
   echo
   echo "options:"
   echo "-n     game name. If we only input game name, then, -m -t -o would have default values."
   echo "-t     testing data path and name in GLOB patterns."
   echo "-o     output path is a directory, and each model would generate an csv file."
   echo "-p     specify the qp value: 1-7"
   echo "-h     Print this message and exit."
   echo
   exit 1
}

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options

qp_value=0

while getopts "hn:m:t:o:p:" flag
do
    case "${flag}" in
        n) gamename=${OPTARG};;
        m) modelpath=${OPTARG};;
        t) testpath=${OPTARG};;
        o) outputpath=${OPTARG};;
        p) qp_value=${OPTARG};;
	*) usage;;
    esac
done

outputpath="./"
if [ -n "${gamename}" ]; then
	if [ -z "${modelpath}" ]; then
		modelpath="./models/${gamename}*"
	fi
	if [ -z "${testpath}" ]; then
		testpath="../datasets/GameImage_dataset/test/${gamename}*/*.png"
	fi
	if [ -z "${outputpath}" ]; then
		outputpath="./"
	fi
elif [ -z "${testpath}" ]; then
	usage
else
	gamename="default"
fi


[ -e ${outputpath} ] || mkdir -p ${outputpath}

echo "Gamename: $gamename";
echo "modelpath: $modelpath";
echo "testpath: $testpath";
echo "outputpath: $outputpath";
echo "qp_value: $qp_value";


############################################################
############################################################
# Main program                                             #
############################################################
############################################################
echo "qp, name, shape, binsize, enc, bpp, dec, psnr, ms_ssim, ms_db" > sota_${gamename}.csv

if [ qp_value != 0 ]; then
    for inpng in ${testpath}; do
        python3 AppEncDec.py compress   ${inpng} tmp.bin tmp.png sota_${gamename}.csv --qp ${qp_value} --model_type 0 --device cuda
        python3 AppEncDec.py decompress ${inpng} tmp.bin tmp.png sota_${gamename}.csv --qp ${qp_value} --model_type 0 --device cuda
    done
else
    for qp_value in {1..7}; do
        for inpng in ${testpath}; do
            python3 AppEncDec.py compress   ${inpng} tmp.bin tmp.png sota_${gamename}.csv --qp ${qp_value} --model_type 0 --device cuda
            python3 AppEncDec.py decompress ${inpng} tmp.bin tmp.png sota_${gamename}.csv --qp ${qp_value} --model_type 0 --device cuda
        done
    done
fi

############################################################
# Output CSV and Plot figure                               #
############################################################
