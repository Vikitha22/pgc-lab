
Matrix Size: 4000 × 4000
Execution Time: 303.118438 seconds
Verification: C[0][0] = 4000.00


OpenMP Matrix Multiplication

Matrix Size: 4000 × 4000
Execution Time: 61.120517 seconds
Verification: C[0][0] = 4000.00


MPI Matrix Multiplication

Matrix Size: 4000 × 4000
MPI Processes: 4
Execution Time: 82.515692 seconds
Verification: C[0][0] = 4000.00


CUDA Matrix Multiplication

Matrix Size: 4000 × 4000
Block Size: 16 × 16
Threads per Block: 256
Grid Size: 250 × 250
Execution Time: Pending
Verification: Pending

## 15. Learning Outcomes

This experiment provided practical understanding of:

- Sequential computation
- Shared-memory parallelism
- OpenMP programming
- CPU multithreading
- Distributed-memory parallelism
- MPI programming
- MPI process distribution
- SSH-based communication
- VMware virtual machine networking
- GPU parallelism
- CUDA programming
- CUDA blocks and threads
- Performance measurement
- Correctness verification
- Parallel performance comparison

## 16. Conclusion

This experiment demonstrates matrix multiplication using sequential, OpenMP, MPI, and CUDA programming models.

The sequential implementation provides a baseline execution time.

The OpenMP implementation uses multiple CPU threads to perform the computation in parallel.

The MPI implementation distributes the computation across four Ubuntu virtual machines, with each MPI process responsible for 1000 rows.

The CUDA implementation is intended to perform the computation using GPU parallelism on an NVIDIA CUDA-capable GPU.

The measured execution times obtained so far are:

Sequential: 303.118438 seconds

OpenMP: 61.120517 seconds

MPI: 82.515692 seconds

CUDA: Pending

The Sequential, OpenMP, and MPI implementations successfully produced:

C[0][0] = 4000.00

This confirms the correctness of the completed implementations.

CUDA results will be added after executing the CUDA program on an NVIDIA CUDA-capable GPU.

## 17. Author

GitHub Username:
Vikitha22

Repository:
Vikitha22/pgc-lab

## 18. Note

All execution times reported in this README are actual measured results from the systems used during the experiment.

CUDA sample/reference timings from the laboratory manual are not used as actual experimental results.Sequential Matrix Multiplication
## 14. Results Summary


12. Compare the execution times.
11. Verify the matrix multiplication result.
10. Execute CUDA implementation on an NVIDIA GPU.
9. Implement CUDA matrix multiplication.
8. Measure MPI execution time.
7. Implement distributed matrix multiplication using MPI.
6. Configure SSH communication between the machines.
5. Configure four Ubuntu virtual machines for MPI.
4. Measure OpenMP execution time.
### MPI

Used for distributed-memory parallelism across multiple virtual machines.

### CUDA

Used for GPU-based parallel computation on NVIDIA CUDA-capable GPUs.

### VMware Workstation

Used to create the four-machine MPI environment.

## 12. Repository Structure

pgc-lab/

    sequential/
        matrix_sequential.c
        screenshots/
            168 lab1.png

    openmp/
        matrix_openmp.c
        screenshots/
            168 lab 2 open mp.png

    mpi/
        matrix_mpi.c
        results.txt

    cuda/
        matrix_cuda.cu
        results.txt
        screenshots/

    README.md

## 13. Experiment Workflow

The experiment follows these stages:

1. Implement sequential matrix multiplication.
2. Measure sequential execution time.
3. Implement OpenMP parallel matrix multiplication.
# Parallel Matrix Multiplication Lab

## 1. Introduction

This project implements matrix multiplication using different parallel programming techniques. The experiment demonstrates the difference between sequential execution, shared-memory parallelism, distributed-memory parallelism, and GPU-based parallelism.

The following approaches are covered:

1. Sequential Matrix Multiplication
2. OpenMP Matrix Multiplication
3. MPI Distributed Matrix Multiplication
4. CUDA Matrix Multiplication

The matrix size used for the experiment is 4000 × 4000.

The correctness of the matrix multiplication is verified using C[0][0] = 4000.00.

## 2. Objectives

The objectives of this experiment are:

- To implement matrix multiplication using a sequential approach.
- To parallelize matrix multiplication using OpenMP.
- To distribute matrix multiplication using MPI.
- To understand communication between multiple MPI processes.
- To implement matrix multiplication using CUDA.
- To compare the execution time of different parallel programming approaches.
- To verify the correctness of the computed matrix.

## 3. Problem Definition

Matrix multiplication is a fundamental operation in scientific computing and high-performance computing.

Given two matrices A and B, the resulting matrix C is calculated as:

C = A × B

For an N × N matrix:

C[i][j] = Σ A[i][k] × B[k][j]

For this experiment:

Matrix Size = 4000 × 4000

Therefore, each matrix contains:

4000 × 4000 = 16,000,000 elements.

The large matrix size makes the problem suitable for studying parallel computing techniques.

## 4. Experimental Environment

Operating System:
Ubuntu 24.04 LTS

Programming Languages:
C
CUDA C/C++

Parallel Programming Technologies:
OpenMP
MPI
CUDA

MPI Implementation:
Open MPI

Matrix Size:
4000 × 4000

## 5. Part A – Sequential Matrix Multiplication

### Description

The sequential implementation performs matrix multiplication using a single CPU thread.

The standard three nested loops are used to calculate the output matrix.

### Source File

sequential/matrix_sequential.c

### Compilation

gcc -O2 matrix_sequential.c -o matrix_sequential

### Execution

./matrix_sequential

### Result

Matrix Size: 4000 × 4000

Execution Time: 303.118438 seconds

Verification:
C[0][0] = 4000.00

The result was successfully verified using the expected value of C[0][0].

## 6. Part B – OpenMP Matrix Multiplication

### Description

OpenMP is used to parallelize the matrix multiplication using multiple CPU threads.

OpenMP provides shared-memory parallelism where multiple threads work on different portions of the matrix simultaneously.

### Source File

openmp/matrix_openmp.c

### Compilation

gcc -O2 -fopenmp matrix_openmp.c -o matrix_openmp

### Execution

./matrix_openmp

### Result

Matrix Size: 4000 × 4000
CUDA execution is currently pending.

The personal laptop used for this experiment contains an Intel Arc 130V GPU and does not contain an NVIDIA CUDA-capable GPU.

Therefore, CUDA results have not been fabricated or replaced with sample values.

The CUDA implementation will be executed on a suitable NVIDIA GPU system and the actual measured results will be added to the repository.

## 9. Performance Comparison

The measured execution times obtained during the experiment are:

Sequential:
303.118438 seconds

OpenMP:
61.120517 seconds

MPI:
82.515692 seconds

CUDA:
Pending

All completed implementations use a matrix size of 4000 × 4000.

## 10. Correctness Verification

The correctness of the matrix multiplication was verified using:

C[0][0]

The expected value is:

C[0][0] = 4000.00

Verification results:

Sequential:
C[0][0] = 4000.00

OpenMP:
C[0][0] = 4000.00

MPI:
C[0][0] = 4000.00

The completed implementations produced the expected verification value.

## 11. Technologies Used

### C

Used for the sequential, OpenMP, and MPI implementations.

### OpenMP

Used for shared-memory CPU parallelism.


Execution Time: 61.120517 seconds

Verification:
C[0][0] = 4000.00

The OpenMP implementation successfully produced the expected result.

## 7. Part C – MPI Distributed Matrix Multiplication

### Description

MPI is used to distribute the matrix multiplication across four processes running on four Ubuntu virtual machines.

The MPI cluster consists of one master machine and three worker machines.

The machines used are:

master
worker1
worker2
worker3

### MPI Network Configuration

Master:
192.168.109.129

Worker 1:
192.168.109.130

Worker 2:
192.168.109.131

Worker 3:
192.168.109.132

All machines were connected through the same VMware virtual network.

Passwordless SSH was configured from the master to the worker machines so that MPI processes could be launched remotely.

### MPI Work Distribution

Rank 0 → master → 1000 rows

Rank 1 → worker1 → 1000 rows

Rank 2 → worker2 → 1000 rows

Rank 3 → worker3 → 1000 rows

Total rows:

1000 + 1000 + 1000 + 1000 = 4000 rows

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
# Parallel Matrix Multiplication Lab

## 1. Introduction

This project implements matrix multiplication using different parallel programming techniques. The experiment demonstrates the difference between sequential execution, shared-memory parallelism, distributed-memory parallelism, and GPU-based parallelism.

The following approaches are covered:

1. Sequential Matrix Multiplication
2. OpenMP Matrix Multiplication
3. MPI Distributed Matrix Multiplication
4. CUDA Matrix Multiplication

The matrix size used for the experiment is 4000 × 4000.

The correctness of the matrix multiplication is verified using C[0][0] = 4000.00.

## 2. Objectives

The objectives of this experiment are:

- To implement matrix multiplication using a sequential approach.
- To parallelize matrix multiplication using OpenMP.
- To distribute matrix multiplication using MPI.
- To understand communication between multiple MPI processes.
- To implement matrix multiplication using CUDA.
- To compare the execution time of different parallel programming approaches.
- To verify the correctness of the computed matrix.


## 3. Problem Definition

Matrix multiplication is a fundamental operation in scientific computing and high-performance computing.

Given two matrices A and B, the resulting matrix C is calculated as:

C = A × B

For an N × N matrix:

C[i][j] = Σ A[i][k] × B[k][j]

For this experiment:

Matrix Size = 4000 × 4000

Therefore, each matrix contains:

4000 × 4000 = 16,000,000 elements.

The large matrix size makes the problem suitable for studying parallel computing techniques.


The MPI implementation successfully distributed the computation across the four virtual machines.

## 8. Part D – CUDA Matrix Multiplication

### Description

CUDA is used to implement matrix multiplication using GPU parallelism.

The CUDA implementation assigns matrix elements to GPU threads. Threads are organized into blocks, and blocks are organized into a grid.

The configuration specified for the experiment is:

Matrix Size: 4000 × 4000

Block Size: 16 × 16

Threads per Block: 256

Grid Size: 250 × 250

Total Matrix Elements:
4000 × 4000 = 16,000,000

### Source File

cuda/matrix_cuda.cu

### Compilation

nvcc -O2 matrix_cuda.cu -o matrix_cuda

### Execution

./matrix_cuda

### GPU Verification

The NVIDIA GPU can be checked using:

nvidia-smi

The CUDA compiler can be checked using:

nvcc --version

### CUDA Status
## 4. Experimental Environment

Operating System:
Ubuntu 24.04 LTS

Programming Languages:
C
CUDA C/C++

MPI

C[0][0] = 4000.00
Matrix Size:
4000 × 4000

## 5. Part A – Sequential Matrix Multiplication
### Description

The sequential implementation performs matrix multiplication using a single CPU thread.
The standard three nested loops are used to calculate the output matrix.


sequential/matrix_sequential.c
Verification:

### Compilation

gcc -O2 matrix_sequential.c -o matrix_sequential

### Execution

./matrix_sequential

### Result


Matrix Size: 4000 × 4000

Execution Time: 303.118438 seconds

Verification:
C[0][0] = 4000.00

The result was successfully verified using the expected value of C[0][0].
Execution Time: 82.515692 seconds

## 6. Part B – OpenMP Matrix Multiplication

### Description

OpenMP is used to parallelize the matrix multiplication using multiple CPU threads.

192.168.109.132
Passwordless SSH was configured from the master to the worker machines so that MPI processes could be launched remotely.

Rank 0 → master → 1000 rows

Rank 2 → worker2 → 1000 rows

Rank 3 → worker3 → 1000 rows

Total rows:


1000 + 1000 + 1000 + 1000 = 4000 rows
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

Matrix Size: 4000 × 4000

Number of MPI Processes: 4

Rank 1 → worker1 → 1000 rows


### MPI Work Distribution
All machines were connected through the same VMware virtual network.


Worker 2:
192.168.109.131

Worker 3:
192.168.109.130

OpenMP provides shared-memory parallelism where multiple threads work on different portions of the matrix simultaneously.
Worker 1:

### Source File

Master:
192.168.109.129

### MPI Network Configuration


openmp/matrix_openmp.c

### Compilation
worker1
worker2
worker3


The machines used are:

master
The MPI cluster consists of one master machine and three worker machines.

### Execution


./matrix_openmp

### Result

MPI is used to distribute the matrix multiplication across four processes running on four Ubuntu virtual machines.

Matrix Size: 4000 × 4000


### Description

## 7. Part C – MPI Distributed Matrix Multiplication
The OpenMP implementation successfully produced the expected result.


C[0][0] = 4000.00
Verification:
Execution Time: 61.120517 seconds
gcc -O2 -fopenmp matrix_openmp.c -o matrix_openmp
### Source File


Open MPI

MPI Implementation:
CUDA
Parallel Programming Technologies:
