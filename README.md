
# Parallel Matrix Multiplication Lab

## Introduction

This project implements matrix multiplication using four different parallel programming approaches:

1. Sequential
2. OpenMP
3. MPI
4. CUDA

The matrix size used in this experiment is **4000 × 4000**.

The correctness verification value is:

**C[0][0] = 4000.00**

## Objectives

- Implement sequential matrix multiplication.
- Parallelize matrix multiplication using OpenMP.
- Distribute matrix multiplication using MPI.
- Implement matrix multiplication using CUDA.
- Understand shared-memory and distributed-memory parallelism.
- Measure execution time.
- Compare the implementations.
- Verify correctness of the computed matrix.

# Part A – Sequential Matrix Multiplication

The sequential implementation performs matrix multiplication using a single CPU thread.

### Source File

sequential/matrix_sequential.c

### Compilation

gcc -O2 matrix_sequential.c -o matrix_sequential

### Execution

./matrix_sequential

### Result

- Matrix Size: 4000 × 4000
- Execution Time: **303.118438 seconds**
- Verification: **C[0][0] = 4000.00**

### Screenshot

sequential/screenshots/168 lab1.png

# Part B – OpenMP Matrix Multiplication

OpenMP is used to parallelize matrix multiplication using multiple CPU threads.

### Source File

openmp/matrix_openmp.c

### Compilation

gcc -O2 -fopenmp matrix_openmp.c -o matrix_openmp

### Execution

./matrix_openmp

### Result

- Matrix Size: 4000 × 4000
- Execution Time: **61.120517 seconds**
- Verification: **C[0][0] = 4000.00**

### Screenshot

openmp/screenshots/168 lab 2 open mp.png

# Part C – MPI Distributed Matrix Multiplication

MPI is used to distribute matrix multiplication across four Ubuntu virtual machines.

### MPI Cluster

| Rank | Host | IP Address | Rows |
|---|---|---|---:|
| Rank 0 | master | 192.168.109.129 | 1000 |
| Rank 1 | worker1 | 192.168.109.130 | 1000 |
| Rank 2 | worker2 | 192.168.109.131 | 1000 |
| Rank 3 | worker3 | 192.168.109.132 | 1000 |

### MPI Hostfile

master slots=1
worker1 slots=1
worker2 slots=1
worker3 slots=1

### Source File

mpi/matrix_mpi.c

### Compilation

mpicc -O2 matrix_mpi.c -o matrix_mpi

### Execution

mpirun -np 4 --hostfile hosts ./matrix_mpi

### Result

- Matrix Size: 4000 × 4000
- MPI Processes: 4
- Execution Time: **82.515692 seconds**
- Verification: **C[0][0] = 4000.00**

### Results File

mpi/results.txt

### Screenshot

mpi/screenshots/168 open mpi.png

# Part D – CUDA Matrix Multiplication

CUDA is used to implement matrix multiplication using GPU parallelism.

### CUDA Configuration

- Matrix Size: 4000 × 4000
- Block Size: 16 × 16
- Threads per Block: 256
- Grid Size: 250 × 250
- Total Matrix Elements: 16,000,000
- Total Blocks: 62,500

### Source File

cuda/matrix_cuda.cu

### Compilation

nvcc -O2 matrix_cuda.cu -o matrix_cuda

### Execution

./matrix_cuda

### GPU Verification

nvidia-smi

nvcc --version

### CUDA Status

CUDA execution is currently pending.

The personal laptop used for this experiment contains an **Intel Arc 130V GPU** rather than an NVIDIA CUDA-capable GPU.

Therefore, CUDA cannot be executed natively on this laptop.

No sample or reference CUDA timing from the laboratory manual is being reported as an actual experimental result.

The CUDA implementation will be executed on a suitable NVIDIA CUDA-capable system, and the actual measured result will be added later.

# Performance Comparison

| Implementation | Matrix Size | Processes / Threads | Execution Time |
|---|---|---|---:|
| Sequential | 4000 × 4000 | 1 CPU thread | 303.118438 s |
| OpenMP | 4000 × 4000 | Multiple CPU threads | 61.120517 s |
| MPI | 4000 × 4000 | 4 MPI processes | 82.515692 s |
| CUDA | 4000 × 4000 | GPU | Pending |

# Correctness Verification

Expected result:

C[0][0] = 4000.00

| Implementation | Verification |
|---|---:|
| Sequential | 4000.00 |
| OpenMP | 4000.00 |
| MPI | 4000.00 |




# Experiment Workflow

1. Implement sequential matrix multiplication.
2. Measure sequential execution time.
3. Implement OpenMP matrix multiplication.
4. Measure OpenMP execution time.
5. Configure four Ubuntu virtual machines.
6. Configure SSH communication.
7. Install Open MPI.
8. Configure the MPI hostfile.
9. Distribute matrix rows among four MPI processes.
10. Execute the MPI program.
11. Record MPI execution time.
12. Verify the matrix multiplication result.
13. Prepare the CUDA implementation.
14. Execute CUDA on an NVIDIA CUDA-capable GPU.
15. Record CUDA execution time.
16. Compare the results.

# Learning Outcomes

This experiment provided practical understanding of:

- Sequential computation
- Matrix multiplication
- OpenMP programming
- CPU multithreading
- Shared-memory parallelism
- MPI programming
- Distributed-memory parallelism
- MPI process distribution
- Workload distribution
- SSH communication
- VMware virtual machine networking
- GPU parallelism
- CUDA programming
- CUDA blocks and threads
- Performance measurement
- Correctness verification
- Parallel performance comparison

# Conclusion

This experiment demonstrates matrix multiplication using Sequential, OpenMP, MPI, and CUDA programming models.

Actual measured execution times:

- Sequential: **303.118438 seconds**
- OpenMP: **61.120517 seconds**
- MPI: **82.515692 seconds**
- CUDA: **Pending**

The Sequential, OpenMP, and MPI implementations successfully produced:

**C[0][0] = 4000.00**

CUDA results will be added after executing the CUDA implementation on an NVIDIA CUDA-capable GPU.

# Author

**GitHub Username:** Vikitha22

**Repository:** pgc-lab

# Note

All execution times reported in this README are actual measured results from the systems used during the experiment.

CUDA sample or reference timings from the laboratory manual are not used as actual experimental results.
EOF
