#!/bin/sh

dir=./log/

echo "Running..."

date > $dir/output-ps
CUDA_VISIBLE_DEVICES=0 python AutoencoderRunner.py --job_name="ps" --task_index=0 >> $dir/output-ps0 2>&1 &
sleep 10
#python AutoencoderRunner.py --job_name="ps" --task_index=2 >> $dir/output-ps2 2>&1 &
#sleep 10
#python AutoencoderRunner.py --job_name="ps" --task_index=3 >> $dir/output-ps3 2>&1 &
#sleep 10
date >> $dir/output-ps
