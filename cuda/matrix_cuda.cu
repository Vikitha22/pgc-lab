#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>

#define N 4000
#define BLOCK_SIZE 16

__global__ void matrixMul(const float *A, const float *B, float *C)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < N && col < N)
    {
        float sum = 0.0f;

        for (int k = 0; k < N; k++)
        {
            sum += A[row * N + k] * B[k * N + col];
        }

        C[row * N + col] = sum;
    }
}

int main()
{
    size_t size = (size_t)N * N * sizeof(float);

    float *h_A = NULL;
    float *h_B = NULL;
    float *h_C = NULL;

    float *d_A = NULL;
    float *d_B = NULL;
    float *d_C = NULL;

    printf("Initializing %d x %d matrices...\n", N, N);

    h_A = (float *)malloc(size);
    h_B = (float *)malloc(size);
    h_C = (float *)malloc(size);

    if (!h_A || !h_B || !h_C)
    {
        printf("Host memory allocation failed.\n");
        return 1;
    }

    for (int i = 0; i < N * N; i++)
    {
        h_A[i] = 1.0f;
        h_B[i] = 1.0f;
    }

    cudaError_t err;

    err = cudaMalloc((void **)&d_A, size);
    if (err != cudaSuccess)
    {
        printf("cudaMalloc A failed: %s\n", cudaGetErrorString(err));
        return 1;
    }

    err = cudaMalloc((void **)&d_B, size);
    if (err != cudaSuccess)
    {
        printf("cudaMalloc B failed: %s\n", cudaGetErrorString(err));
        return 1;
    }

    err = cudaMalloc((void **)&d_C, size);
    if (err != cudaSuccess)
    {
        printf("cudaMalloc C failed: %s\n", cudaGetErrorString(err));
        return 1;
    }

    err = cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice);
    if (err != cudaSuccess)
    {
        printf("cudaMemcpy A failed: %s\n", cudaGetErrorString(err));
        return 1;
    }

    err = cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice);
    if (err != cudaSuccess)
    {
        printf("cudaMemcpy B failed: %s\n", cudaGetErrorString(err));
        return 1;
    }

    dim3 threadsPerBlock(BLOCK_SIZE, BLOCK_SIZE);

    dim3 numBlocks(
        (N + BLOCK_SIZE - 1) / BLOCK_SIZE,
        (N + BLOCK_SIZE - 1) / BLOCK_SIZE
    );

    cudaEvent_t start, stop;

    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    cudaEventRecord(start);

    matrixMul<<<numBlocks, threadsPerBlock>>>(d_A, d_B, d_C);

    err = cudaGetLastError();

    if (err != cudaSuccess)
    {
        printf("Kernel launch failed: %s\n", cudaGetErrorString(err));
        return 1;
    }

    err = cudaDeviceSynchronize();

    if (err != cudaSuccess)
    {
        printf("Kernel execution failed: %s\n", cudaGetErrorString(err));
        return 1;
    }

    cudaEventRecord(stop);
    cudaEventSynchronize(stop);

    float milliseconds = 0.0f;

    cudaEventElapsedTime(&milliseconds, start, stop);

    err = cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);

    if (err != cudaSuccess)
    {
        printf("cudaMemcpy C failed: %s\n", cudaGetErrorString(err));
        return 1;
    }

    printf("\nCUDA Matrix Multiplication Completed\n");
    printf("Matrix Size = %d x %d\n", N, N);
    printf("Block Size = %d x %d\n", BLOCK_SIZE, BLOCK_SIZE);
    printf("Grid Size = %d x %d\n", numBlocks.x, numBlocks.y);
    printf("CUDA Kernel Execution Time = %.6f seconds\n",
           milliseconds / 1000.0f);
    printf("Verification C[0][0] = %.2f\n", h_C[0]);

    cudaFree(d_A);
    cudaFree(d_B);
    cudaFree(d_C);

    free(h_A);
    free(h_B);
    free(h_C);

    cudaEventDestroy(start);
    cudaEventDestroy(stop);

    return 0;
}
