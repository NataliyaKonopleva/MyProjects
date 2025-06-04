#ifndef S21_MATRIX_H_INCLUDED
#define S21_MATRIX_H_INCLUDED

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define OK 0
#define ERROR_CORRECT 1
#define ERROR_CALC 2
#define EPS 1E-7

#define SUCCESS 1
#define FAILURE 0

typedef struct matrix_struct {
  double **matrix;
  int rows;
  int columns;
} matrix_t;

/* create_matrix */
int s21_create_matrix(int rows, int columns, matrix_t *result);
/* remove_matrix */
void s21_remove_matrix(matrix_t *A);
/* eq_matrix */
int s21_eq_matrix(matrix_t *A, matrix_t *B);
/* sum_matrix */
int s21_sum_matrix(matrix_t *A, matrix_t *B, matrix_t *result);
/* sub_matrix */
int s21_sub_matrix(matrix_t *A, matrix_t *B, matrix_t *result);
/* mult_number */
int s21_mult_number(matrix_t *A, double number, matrix_t *result);
/* mult_matrix */
int s21_mult_matrix(matrix_t *A, matrix_t *B, matrix_t *result);
/* transpose */
int s21_transpose(matrix_t *A, matrix_t *result);
/* calc_complements */
int s21_calc_complements(matrix_t *A, matrix_t *result);
/* determinant */
int s21_determinant(matrix_t *A, double *result);
/* inverse_matrix */
int s21_inverse_matrix(matrix_t *A, matrix_t *result);
/*int is_correct_matrix(matrix_t *A);
int is_size_eq_matrix(matrix_t *A, matrix_t *B);
int is_square_matrix(matrix_t *A);
double determinant(matrix_t *A);
double minor(matrix_t *A, int row, int col);
int create_submatrix(int row, int col, matrix_t *A, matrix_t *submatrix);
void initialize_matrix(matrix_t *A, double start_value, double iteration_step);
*/

#endif
