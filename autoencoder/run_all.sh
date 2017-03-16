#!/bin/sh

dir=./log
echo "Running..."

date > $dir/output-ps
export CUDA_VISIBLE_DEVICES=""
python AutoencoderRunner.py --job_name="ps" --task_index=$1 >> $dir/output-ps$1 2>&1 &
sleep 30
export CUDA_VISIBLE_DEVICES=1
python AutoencoderRunner.py --job_name="worker" --task_index=$1 >> $dir/output-wk$1 2>&1
echo "1111"
date >> $dir/output-ps

