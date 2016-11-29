# Tensorflow Auto Parallelizer

Automatically transform your Tensorflow from single machine to multiple machines.

## Usaage

1. Fill in the testbed configuration in ```testbed.cfg```.
2. ```import tfag``` in your single server Tensorflow code. 
3. Tag your main computation code with ```@worker```.
4. Run your code with the helper scripts.