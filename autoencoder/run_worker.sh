#!/bin/sh

dir=./log/

echo "Running..."

date > $dir/output-worker
export CUDA_VISIBLE_DEVICES=0
python AutoencoderRunner.py --job_name="worker" --task_index=0 >> $dir/output-worker0 2>&1 &
sleep 10
export CUDA_VISIBLE_DEVICES=1
python AutoencoderRunner.py --job_name="worker" --task_index=1 >> $dir/output-worker1 2>&1 &
sleep 10
export CUDA_VISIBLE_DEVICES=2
python AutoencoderRunner.py --job_name="worker" --task_index=2 >> $dir/output-worker2 2>&1 &
sleep 10
export CUDA_VISIBLE_DEVICES=3
python AutoencoderRunner.py --job_name="worker" --task_index=3 >> $dir/output-worker3 2>&1 &
sleep 10
date >> $dir/output-worker
