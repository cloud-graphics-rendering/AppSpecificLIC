# The implementation of GDN is inherited from
# https://github.com/jorge-pessoa/pytorch-gdn,
# under the MIT License. The source code is 
# also related to an implementation
# of the arithmetic coding by Nayuki from
# https://github.com/nayuki/Reference-arithmetic-coding
# under the MIT License.
#
# This file is being made available under the BSD License.  
# Copyright (c) 2021 Yueyu Hu

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import argparse
import glob

import numpy as np
import pickle

import math
import time
import os

from networks import *
import sys
import cv2
from scipy import ndimage

def psnr(img1, img2):
  # img1 and img2 have range [0, 255]
  mse = np.mean((img1 - img2)**2)
  if mse == 0:
      return float('inf')
  return 20 * math.log10(255.0 / math.sqrt(mse))

def ssim(img1, img2, cs_map=False):
  C1 = (0.01 * 255)**2
  C2 = (0.03 * 255)**2
  
  kernel = cv2.getGaussianKernel(11, 1.5)
  window = np.outer(kernel, kernel.transpose())

  mu1 = cv2.filter2D(img1, -1, window)[5:-5, 5:-5]  # valid
  mu2 = cv2.filter2D(img2, -1, window)[5:-5, 5:-5]
  mu1_sq = mu1**2
  mu2_sq = mu2**2
  mu1_mu2 = mu1 * mu2
  sigma1_sq = cv2.filter2D(img1**2, -1, window)[5:-5, 5:-5] - mu1_sq
  sigma2_sq = cv2.filter2D(img2**2, -1, window)[5:-5, 5:-5] - mu2_sq
  sigma12 = cv2.filter2D(img1 * img2, -1, window)[5:-5, 5:-5] - mu1_mu2

  ssim_map = ((2 * mu1_mu2 + C1) * (2 * sigma12 + C2)) / ((mu1_sq + mu2_sq + C1) *
                                                          (sigma1_sq + sigma2_sq + C2))

  if cs_map:
      return ssim_map.mean(), ((2.0*sigma12 + C2)/(sigma1_sq + sigma2_sq + C2)).mean()
  else:
      return ssim_map.mean()

def msssim(img1, img2):
  """This function implements Multi-Scale Structural Similarity (MSSSIM) Image 
  Quality Assessment according to Z. Wang's "Multi-scale structural similarity 
  for image quality assessment" Invited Paper, IEEE Asilomar Conference on 
  Signals, Systems and Computers, Nov. 2003 
  
  Author's MATLAB implementation:-
  http://www.cns.nyu.edu/~lcv/ssim/msssim.zip
  """
  level = 5
  weight = np.array([0.0448, 0.2856, 0.3001, 0.2363, 0.1333])
  downsample_filter = np.ones((2, 2, 2))/8.0
  mssim = np.array([])
  mcs = np.array([])
  im1 = img1
  im2 = img2
  for l in range(level):
    ssim_map, cs_map = ssim(im1, im2, cs_map=True)
    mssim = np.append(mssim, ssim_map)
    mcs = np.append(mcs, cs_map)
      
    filtered_im1 = ndimage.filters.convolve(im1, downsample_filter, mode='reflect')
    filtered_im2 = ndimage.filters.convolve(im2, downsample_filter, mode='reflect')
    im1 = filtered_im1[::2, ::2]
    im2 = filtered_im2[::2, ::2]
  return (np.prod(mcs[0:level-1]**weight[0:level-1])*(mssim[level-1]**weight[level-1]))

if __name__ == "__main__":
  parser = argparse.ArgumentParser(
      formatter_class=argparse.ArgumentDefaultsHelpFormatter)
  parser.add_argument(
      "command", choices=["compress", "decompress"],
      help="What to do? Choose from `compress` and `decompress`")
  parser.add_argument(
      "input", nargs="?",
      help="Input filename.")
  parser.add_argument(
      "output", nargs="?",
      help="Output bin filename.")
  parser.add_argument(
      "outputpng", nargs="?",
      help="Output png filename.")
  parser.add_argument(
      "outputcsv", nargs="?",
      help="Output csv filename.")
  parser.add_argument(
      "--qp", default=1, type=int,
      help="Quality parameter, choose from [1~7] (model0) or [1~8] (model1)"
  )
  parser.add_argument(
      "--model_type", default=0, type=int,
      help="Model type, choose from 0:PSNR 1:MS-SSIM"
  )
  parser.add_argument(
      "--save_recon", default=0, type=int,
      help="Whether to save reconstructed image in the encoding process."
  )

  parser.add_argument(
      "--device", default='cpu', type=str,
      help="Which device does the network run on?"
  )

  args = parser.parse_args()

  if args.input is None or args.output is None:
    raise ValueError("Need input and output filename for compression.")
  if args.command == "compress":
    start = time.time()
    w, h = compress_low(args)
    end = time.time()
    binsize = os.path.getsize(args.output)
    bpp = binsize*8/(w*h)
    print("%d, %s, %dx%d, %10d, %3.5f, %3.5f," % (args.qp, args.input, w, h, binsize, end-start, bpp))
    with open('%s' % args.outputcsv, 'a') as f:
      f.write("%d, %s, %dx%d, %10d, %3.5f, %3.5f," % (args.qp, args.input, w, h, binsize, end-start, bpp))
  elif args.command == "decompress":
    start = time.time()
    decompress_low(args)
    end = time.time()

    img1 = np.asarray(cv2.imread(args.input))
    img2 = np.asarray(cv2.imread(args.outputpng))
    if not img1.shape == img2.shape:
      raise ValueError('Input images must have the same dimensions.')
    img1 = img1.astype(np.float64)
    img2 = img2.astype(np.float64)
    psnr_value 	  = psnr(img1, img2)
    ms_ssim_value = msssim(img1, img2)
    ms_db = -10 * math.log10(1-ms_ssim_value)  
    print("%3.5f, %3.5f, %3.5f, %3.5f" % (end-start, psnr_value, ms_ssim_value, ms_db))
    with open('%s' % args.outputcsv, 'a') as f:
      f.write("%3.5f, %3.5f, %3.5f, %3.5f\n" % (end-start, psnr_value, ms_ssim_value, ms_db))
