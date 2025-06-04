#ifndef S21_HELPER_H_INCLUDED
#define S21_HELPER_H_INCLUDED

#include "s21_matrix.h"

int is_correct_matrix(matrix_t *A);
int is_size_eq_matrix(matrix_t *A, matrix_t *B);
int is_square_matrix(matrix_t *A);
double determinant(matrix_t *A);
double minor(matrix_t *A, int row, int col);
int create_submatrix(int row, int col, matrix_t *A, matrix_t *submatrix);
void initialize_matrix(matrix_t *A, double start_value, double iteration_step);

#endif
