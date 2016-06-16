#!/usr/bin/env sh
# Compute the mean image from the 4 kth training lmdbs (4 folds)
# N.B. this is available in data/kth-tips-2b

EXAMPLE=examples/kth-tips-2b
DATA=data/kth-tips-2b
TOOLS=build/tools

$TOOLS/compute_image_mean $EXAMPLE/kth_train1_lmdb \
  $DATA/kth_mean1.binaryproto

$TOOLS/compute_image_mean $EXAMPLE/kth_train2_lmdb \
  $DATA/kth_mean2.binaryproto

$TOOLS/compute_image_mean $EXAMPLE/kth_train3_lmdb \
  $DATA/kth_mean3.binaryproto

$TOOLS/compute_image_mean $EXAMPLE/kth_train4_lmdb \
  $DATA/kth_mean4.binaryproto

# Link one fold
ln -s  kth_mean1.binaryproto $DATA/kth_mean.binaryproto

echo "Mean files created, fold 1 linked ."
