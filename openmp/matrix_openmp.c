#include <stdio.h>
#include <omp.h>

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

    double start = omp_get_wtime();

    #pragma omp parallel for
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            double sum = 0.0;

            for (int k = 0; k < N; k++) {
                sum += A[i][k] * B[k][j];
            }

            C[i][j] = sum;
        }
    }

    double end = omp_get_wtime();

    printf("OpenMP Matrix Multiplication\n");
    printf("Matrix size: %d x %d\n", N, N);
    printf("Time: %.6f seconds\n", end - start);
    printf("Verification: C[0][0] = %.2f\n", C[0][0]);

    return 0;
}
