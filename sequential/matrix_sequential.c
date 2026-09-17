#include <stdio.h>
#include <time.h>

#define N 4000

static double A[N][N];
static double B[N][N];
static double C[N][N];

int main() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            A[i][j] = 1.0;
            B[i][j] = 1.0;
        }
    }

    clock_t start = clock();

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            double sum = 0.0;

            for (int k = 0; k < N; k++) {
                sum += A[i][k] * B[k][j];
            }

            C[i][j] = sum;
        }
    }

    clock_t end = clock();

    double elapsed =
        (double)(end - start) / CLOCKS_PER_SEC;

    printf("Sequential Matrix Multiplication\n");
    printf("Matrix size: %d x %d\n", N, N);
    printf("Time: %.6f seconds\n", elapsed);
    printf("Verification: C[0][0] = %.2f\n", C[0][0]);

    return 0;
}
