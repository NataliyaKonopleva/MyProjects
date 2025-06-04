#include <check.h>
#include <stdlib.h>

#include "../s21_matrix.h"
#include "../s21_tests.h"

void set(double *array, matrix_t *A) {
  int k = 0;
  for (int i = 0; i < A->rows; i++) {
    for (int j = 0; j < A->columns; j++) {
      A->matrix[i][j] = array[k++];
    }
  }
}

START_TEST(create_matrix) {
  matrix_t s21_matrix;

  ck_assert_int_eq(s21_create_matrix(5, 5, &s21_matrix), 0);
  s21_remove_matrix(&s21_matrix);

  ck_assert_int_eq(s21_create_matrix(0, 0, &s21_matrix), 1);
  ck_assert_int_eq(s21_create_matrix(-1, 10, &s21_matrix), 1);
  ck_assert_int_eq(s21_create_matrix(1, -10, &s21_matrix), 1);
  ck_assert_int_eq(s21_create_matrix(5, 5, NULL), 1);
  s21_create_matrix(5, 5, &s21_matrix);
  s21_remove_matrix(NULL);
  s21_remove_matrix(&s21_matrix);
}
END_TEST

START_TEST(arithmetic) {
  matrix_t A = {0};
  matrix_t B = {0};
  matrix_t C = {0};
  matrix_t D = {0};

  ck_assert_int_eq(s21_sum_matrix(&A, &B, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_sum_matrix(&A, NULL, &B), ERROR_CORRECT);
  ck_assert_int_eq(s21_sum_matrix(NULL, &A, &B), ERROR_CORRECT);
  ck_assert_int_eq(s21_sum_matrix(&A, NULL, &B), ERROR_CORRECT);

  ck_assert_int_eq(s21_sub_matrix(&A, &B, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_sub_matrix(&A, NULL, &B), ERROR_CORRECT);
  ck_assert_int_eq(s21_sub_matrix(NULL, &A, &B), ERROR_CORRECT);
  ck_assert_int_eq(s21_sub_matrix(&A, NULL, &B), ERROR_CORRECT);

  s21_create_matrix(4, 4, &A);
  s21_create_matrix(5, 5, &B);

  ck_assert_int_eq(s21_sum_matrix(&A, &B, &C), ERROR_CALC);
  ck_assert_int_eq(s21_sub_matrix(&A, &B, &C), ERROR_CALC);

  s21_remove_matrix(&A);
  s21_remove_matrix(&B);

  double A_nums[6] = {1, 2, 3, 4, 5, 6};
  double B_nums[6] = {2, 3, 4, 5, 6, 7};
  double result_nums[6] = {3, 5, 7, 9, 11, 13};
  // double zero[6] = {0, 0, 0, 0, 0, 0};

  s21_create_matrix(3, 2, &A);
  s21_create_matrix(3, 2, &B);
  // set(zero, &B);
  ck_assert_int_eq(s21_sub_matrix(&A, &A, &C), 0);
  ck_assert_int_eq(s21_eq_matrix(&A, &C), 1);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);

  s21_create_matrix(3, 2, &A);
  s21_create_matrix(3, 2, &B);
  s21_create_matrix(3, 2, &C);
  set(A_nums, &A);
  set(B_nums, &B);
  set(result_nums, &C);

  ck_assert_int_eq(s21_sum_matrix(&A, &B, &D), 0);
  ck_assert_int_eq(s21_eq_matrix(&C, &D), 1);

  s21_remove_matrix(&C);
  s21_remove_matrix(&D);

  for (int i = 0; i < 6; i++) {
    result_nums[i] = -1;
  }
  s21_create_matrix(3, 2, &C);
  set(result_nums, &C);

  ck_assert_int_eq(s21_sub_matrix(&A, &B, &D), 0);
  ck_assert_int_eq(s21_eq_matrix(&C, &D), 1);
  ck_assert_int_eq(s21_eq_matrix(&C, &A), 0);

  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);
  s21_remove_matrix(&D);

  ck_assert_int_eq(s21_mult_number(NULL, 10.0, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_mult_number(&A, 10.0, NULL), ERROR_CORRECT);

  s21_create_matrix(3, 2, &A);
  s21_create_matrix(3, 2, &C);
  double num[6] = {1, 2, 3, 4, 5, 6};
  double r_num[6] = {10, 20, 30, 40, 50, 60};
  set(num, &A);
  set(r_num, &C);
  ck_assert_int_eq(s21_mult_number(&A, 10.0, &B), 0);
  ck_assert_int_eq(s21_eq_matrix(&B, &C), 1);

  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);

  double number = 3901.904;

  double H_nums[9] = {121239.122013, 2401.12392,   -348901.2, 2389014,
                      912039.12389,  129034.23400, 0,         1203,
                      9000000.123};
  double nums[9] = {473063415.139012752,
                    9368955.02794368,
                    -1361378987.8848,
                    9321703282.656,
                    3558689105.66288656,
                    503479193.781536,
                    0,
                    4693990.512,
                    35117136479.934192};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &B);
  set(H_nums, &A);
  set(nums, &B);
  int res = s21_mult_number(&A, number, &C);
  ck_assert_int_eq(s21_eq_matrix(&B, &C), 1);
  ck_assert_int_eq(res, 0);

  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);

  ck_assert_int_eq(s21_mult_matrix(NULL, &A, &A), 1);
  ck_assert_int_eq(s21_mult_matrix(&A, NULL, &A), 1);
  ck_assert_int_eq(s21_mult_matrix(&A, &A, NULL), 1);

  s21_create_matrix(2, 3, &A);
  s21_create_matrix(2, 3, &B);

  ck_assert_int_eq(s21_mult_matrix(&A, &B, &C), 2);

  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);

  double Q_nums[6] = {1.2, 2.4, 3.6, 4.8, 6.0, 7.2};
  double S_nums[6] = {3.5, 7.0, 10.5, 14.0, 17.5, 21.0};
  double result_num[9] = {92.4, 117.6, 205.8, 268.8};
  s21_create_matrix(2, 3, &A);
  s21_create_matrix(3, 2, &B);
  s21_create_matrix(2, 2, &C);
  set(Q_nums, &A);
  set(S_nums, &B);
  set(result_num, &C);

  res = s21_mult_matrix(&A, &B, &D);

  ck_assert_int_eq(s21_eq_matrix(&C, &D), 1);
  ck_assert_int_eq(res, 0);

  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);
  s21_remove_matrix(&D);
}
END_TEST

START_TEST(calc_complements) {
  ck_assert_int_eq(s21_calc_complements(NULL, NULL), 1);
  matrix_t A = {0};
  matrix_t B = {0};
  matrix_t C = {0};
  double A_nums[9] = {1, 2, 3, 0, 4, 2, 5, 2, 1};
  double result_nums[9] = {0, 10, -20, 4, -14, 8, -8, -2, 4};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &C);
  set(A_nums, &A);
  set(result_nums, &C);
  int res = s21_calc_complements(&A, &B);
  ck_assert_int_eq(s21_eq_matrix(&B, &C), 1);
  ck_assert_int_eq(res, 0);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);

  s21_create_matrix(1, 1, &A);
  A.matrix[0][0] = 16;
  res = s21_calc_complements(&A, &C);
  s21_create_matrix(1, 1, &B);
  B.matrix[0][0] = 1;
  ck_assert_int_eq(s21_eq_matrix(&C, &B), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);
}
END_TEST

START_TEST(transpose) {
  matrix_t A = {0};
  matrix_t B = {0};
  matrix_t C = {0};
  ck_assert_int_eq(s21_transpose(NULL, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_transpose(&A, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_transpose(&A, &A), ERROR_CORRECT);

  double A_nums[6] = {1, 2, 3, 4, 5, 6};
  double result_nums[6] = {1, 4, 2, 5, 3, 6};
  s21_create_matrix(2, 3, &A);
  s21_create_matrix(3, 2, &C);
  set(A_nums, &A);
  set(result_nums, &C);
  int res = s21_transpose(&A, &B);
  ck_assert_int_eq(s21_eq_matrix(&C, &B), 1);
  ck_assert_int_eq(res, 0);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);
}
END_TEST

START_TEST(test_determinant) {
  matrix_t A = {0};
  double determinant = 2.0;
  ck_assert_int_eq(s21_determinant(&A, &determinant), 1);
  ck_assert_int_eq(s21_determinant(&A, NULL), 1);
  ck_assert_int_eq(s21_determinant(NULL, &determinant), 1);

  s21_create_matrix(1, 1, &A);
  A.matrix[0][0] = 0.0;
  s21_determinant(&A, &determinant);
  ck_assert_double_eq_tol(determinant, 0.0, EPS);
  s21_remove_matrix(&A);

  s21_create_matrix(1, 1, &A);
  A.matrix[0][0] = 1.0;
  ck_assert_uint_eq(s21_determinant(&A, &determinant), OK);
  ck_assert_double_eq_tol(determinant, 1.0, EPS);
  s21_remove_matrix(&A);

  s21_create_matrix(1, 1, &A);
  A.matrix[0][0] = -213123.464566456;
  s21_determinant(&A, &determinant);
  ck_assert_double_eq_tol(determinant, -213123.464566456, EPS);
  s21_remove_matrix(&A);

  double arr[4] = {0, 0, 0, 0};
  s21_create_matrix(2, 2, &A);
  set(arr, &A);
  s21_determinant(&A, &determinant);
  ck_assert_double_eq_tol(determinant, 0., EPS);
  s21_remove_matrix(&A);

  double arra[16] = {4.,  4., 4.,  4.,  5., 6.,  7.,  8.,
                     10., 2., 12., 13., 1., 16., 17., 4.};

  s21_create_matrix(4, 5, &A);
  ck_assert_int_eq(s21_determinant(&A, &determinant), 2);
  s21_remove_matrix(&A);

  s21_create_matrix(4, 4, &A);
  set(arra, &A);
  s21_determinant(&A, &determinant);
  ck_assert_double_eq_tol(determinant, -1512., EPS);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(inverse_matrix) {
  matrix_t A = {0};
  matrix_t B = {0};
  matrix_t C = {0};
  ck_assert_int_eq(s21_inverse_matrix(&A, &A), 1);
  ck_assert_int_eq(s21_inverse_matrix(&A, NULL), 1);
  ck_assert_int_eq(s21_inverse_matrix(NULL, &A), 1);
  s21_create_matrix(10, 10, &A);
  ck_assert_int_eq(s21_inverse_matrix(NULL, &A), 1);
  ck_assert_int_eq(s21_inverse_matrix(&A, &A), ERROR_CALC);
  s21_remove_matrix(&A);

  s21_create_matrix(1, 1, &A);
  s21_create_matrix(1, 1, &C);
  A.matrix[0][0] = 42.12849;
  C.matrix[0][0] = 1. / 42.12849;
  int res = s21_inverse_matrix(&A, &B);
  ck_assert_double_eq(s21_eq_matrix(&B, &C), SUCCESS);

  ck_assert_int_eq(res, 0);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);

  double A_nums[9] = {2, 5, 7, 6, 3, 4, 5, -2, -3};
  double result_nums[9] = {1, -1, 1, -38, 41, -34, 27, -29, 24};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &C);
  set(A_nums, &A);
  set(result_nums, &C);
  res = s21_inverse_matrix(&A, &B);
  ck_assert_double_eq(s21_eq_matrix(&B, &C), SUCCESS);
  ck_assert_int_eq(res, 0);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&C);
}
END_TEST

START_TEST(test_NULLS) {
  matrix_t A = {0};
  ck_assert_int_eq(s21_eq_matrix(&A, &A), FAILURE);
  ck_assert_int_eq(s21_eq_matrix(&A, NULL), FAILURE);
  ck_assert_int_eq(s21_eq_matrix(NULL, &A), FAILURE);
  ck_assert_int_eq(s21_eq_matrix(NULL, NULL), FAILURE);

  ck_assert_int_eq(s21_calc_complements(&A, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_calc_complements(&A, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_calc_complements(NULL, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_calc_complements(NULL, NULL), ERROR_CORRECT);

  ck_assert_int_eq(s21_create_matrix(5, 4, NULL), ERROR_CORRECT);

  double det = 0;
  ck_assert_int_eq(s21_determinant(NULL, &det), ERROR_CORRECT);

  ck_assert_int_eq(s21_inverse_matrix(&A, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_inverse_matrix(&A, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_inverse_matrix(NULL, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_inverse_matrix(NULL, NULL), ERROR_CORRECT);

  ck_assert_int_eq(s21_sum_matrix(&A, &A, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_sum_matrix(&A, NULL, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_sum_matrix(NULL, &A, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_sum_matrix(&A, &A, NULL), ERROR_CORRECT);

  ck_assert_int_eq(s21_sub_matrix(&A, &A, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_sub_matrix(&A, NULL, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_sub_matrix(NULL, &A, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_sub_matrix(&A, &A, NULL), ERROR_CORRECT);

  ck_assert_int_eq(s21_transpose(&A, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_transpose(&A, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_transpose(NULL, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_transpose(NULL, NULL), ERROR_CORRECT);

  ck_assert_int_eq(s21_mult_number(&A, det, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_mult_number(NULL, det, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_mult_number(&A, det, NULL), ERROR_CORRECT);

  ck_assert_int_eq(s21_mult_matrix(&A, &A, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_mult_matrix(&A, NULL, &A), ERROR_CORRECT);
  ck_assert_int_eq(s21_mult_matrix(NULL, &A, NULL), ERROR_CORRECT);
  ck_assert_int_eq(s21_mult_matrix(&A, &A, NULL), ERROR_CORRECT);
}
END_TEST

START_TEST(eq_matrix) {
  matrix_t s21_matrixA = {0};
  matrix_t s21_matrixB = {0};

  s21_create_matrix(5, 5, &s21_matrixA);
  s21_create_matrix(5, 5, &s21_matrixB);
  ck_assert_int_eq(s21_eq_matrix(&s21_matrixA, &s21_matrixB), SUCCESS);

  s21_remove_matrix(&s21_matrixA);
  s21_remove_matrix(&s21_matrixB);

  s21_create_matrix(2, 5, &s21_matrixB);
  ck_assert_int_eq(s21_eq_matrix(&s21_matrixA, &s21_matrixB), FAILURE);

  s21_remove_matrix(&s21_matrixA);
  s21_remove_matrix(&s21_matrixB);

  s21_create_matrix(5, 1, &s21_matrixA);
  s21_create_matrix(5, 2, &s21_matrixB);
  ck_assert_int_eq(s21_eq_matrix(&s21_matrixA, &s21_matrixB), FAILURE);

  s21_remove_matrix(&s21_matrixA);
  s21_remove_matrix(&s21_matrixB);

  s21_create_matrix(5, 5, &s21_matrixA);
  s21_create_matrix(5, 5, &s21_matrixB);
  s21_matrixA.matrix[0][0] = 10;
  ck_assert_int_eq(s21_eq_matrix(&s21_matrixA, &s21_matrixB), FAILURE);

  s21_remove_matrix(&s21_matrixA);
  s21_remove_matrix(&s21_matrixB);

  s21_create_matrix(5, 5, &s21_matrixB);
  ck_assert_int_eq(s21_eq_matrix(NULL, &s21_matrixB), FAILURE);

  s21_remove_matrix(&s21_matrixB);

  s21_create_matrix(5, 5, &s21_matrixA);
  ck_assert_int_eq(s21_eq_matrix(&s21_matrixA, NULL), FAILURE);

  s21_remove_matrix(&s21_matrixA);

  s21_create_matrix(1, 1, &s21_matrixA);
  s21_create_matrix(1, 1, &s21_matrixB);
  s21_matrixA.matrix[0][0] = 10;
  s21_matrixB.matrix[0][0] = 10;
  ck_assert_int_eq(s21_eq_matrix(&s21_matrixA, &s21_matrixB), SUCCESS);
  s21_remove_matrix(&s21_matrixA);
  s21_remove_matrix(&s21_matrixB);

  s21_create_matrix(3, 2, &s21_matrixA);
  s21_create_matrix(3, 2, &s21_matrixB);
  double ar1[] = {1, 2, 3, 4, 5, 6};
  set(ar1, &s21_matrixA);
  set(ar1, &s21_matrixB);
  ck_assert_int_eq(s21_eq_matrix(&s21_matrixA, &s21_matrixB), SUCCESS);
  s21_remove_matrix(&s21_matrixA);
  s21_remove_matrix(&s21_matrixB);
}
END_TEST

START_TEST(s21_create_matrix_1) {
  // success creation
  matrix_t A = {};
  ck_assert_int_eq(s21_create_matrix(5, 5, &A), OK);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_create_matrix_2) {
  // failure null pointer
  ck_assert_int_eq(s21_create_matrix(5, 5, NULL), ERROR_CORRECT);
}
END_TEST

START_TEST(s21_create_matrix_3) {
  // failure incorrect rows/columns
  matrix_t A = {};
  ck_assert_int_eq(s21_create_matrix(5, 0, &A), ERROR_CORRECT);
}
END_TEST

START_TEST(s21_remove_matrix_1) {
  // success remove
  matrix_t A = {};
  s21_create_matrix(5, 5, &A);
  s21_remove_matrix(&A);
  ck_assert_ptr_null(A.matrix);
}
END_TEST

START_TEST(s21_remove_matrix_2) {
  // failure handle null pointer
  s21_remove_matrix(NULL);
  ck_assert_int_eq(1, 1);
}
END_TEST

START_TEST(s21_remove_matrix_3) {
  // failure handle INCORRECT_MATRIX structure
  matrix_t A = {};
  s21_remove_matrix(&A);
  ck_assert_int_eq(1, 1);
}
END_TEST

START_TEST(s21_eq_matrix_1) {
  // success with initialized values
  matrix_t A = {};
  matrix_t B = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  initialize_matrix(&A, 21, 21);
  initialize_matrix(&B, 21, 21);
  ck_assert_int_eq(s21_eq_matrix(&A, &B), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
}
END_TEST

START_TEST(s21_eq_matrix_2) {
  // success with uninitialized values
  matrix_t A = {};
  matrix_t B = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  ck_assert_int_eq(s21_eq_matrix(&A, &B), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
}
END_TEST

START_TEST(s21_eq_matrix_3) {
  // success with a difference of less than 1e-7
  matrix_t A = {};
  matrix_t B = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  initialize_matrix(&A, 1, 0.000000001);
  initialize_matrix(&B, 1, 0.000000002);
  ck_assert_int_eq(s21_eq_matrix(&A, &B), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
}
END_TEST

START_TEST(s21_eq_matrix_4) {
  // failure with different dimensions of matrices
  matrix_t A = {};
  matrix_t B = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(3, 4, &B);
  ck_assert_int_eq(s21_eq_matrix(&A, &B), FAILURE);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
}
END_TEST

START_TEST(s21_eq_matrix_5) {
  // failure with INCORRECT_MATRIX
  matrix_t A = {};
  matrix_t B = {};
  s21_create_matrix(5, 5, &A);
  ck_assert_int_eq(s21_eq_matrix(&A, &B), FAILURE);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_eq_matrix_6) {
  // failure with different values
  matrix_t A = {};
  matrix_t B = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  initialize_matrix(&A, 21, 1);
  initialize_matrix(&B, 42, 1);
  ck_assert_int_eq(s21_eq_matrix(&A, &B), FAILURE);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
}
END_TEST

START_TEST(s21_sum_matrix_1) {
  // failure error with wrong matrices
  matrix_t A = {};
  matrix_t B = {};
  ck_assert_int_eq(s21_sum_matrix(&A, &B, NULL), ERROR_CORRECT);
}
END_TEST

START_TEST(s21_sum_matrix_2) {
  // failure with different dimensions of matrices
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  s21_create_matrix(4, 4, &A);
  s21_create_matrix(5, 5, &B);
  ck_assert_int_eq(s21_sum_matrix(&A, &B, &result), ERROR_CALC);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
}
END_TEST

START_TEST(s21_sum_matrix_3) {
  // failure with non-finite value
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  initialize_matrix(&A, 1, 1);
  initialize_matrix(&B, 1, 1);
  B.matrix[3][3] = INFINITY;
  ck_assert_int_eq(s21_sum_matrix(&A, &B, &result), ERROR_CALC);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
}
END_TEST

START_TEST(s21_sum_matrix_4) {
  // sucess with initialized values
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  s21_create_matrix(5, 5, &eq_matrix);
  initialize_matrix(&A, 1, 1);
  initialize_matrix(&B, 1, 1);
  initialize_matrix(&eq_matrix, 2, 2);
  ck_assert_int_eq(s21_sum_matrix(&A, &B, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_sum_matrix_5) {
  // sucess with uninitialized values
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  s21_create_matrix(5, 5, &eq_matrix);
  ck_assert_int_eq(s21_sum_matrix(&A, &B, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_sum_matrix_6) {
  // sucess with task refence
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &B);
  s21_create_matrix(3, 3, &eq_matrix);
  A.matrix[0][0] = 1, A.matrix[0][1] = 2, A.matrix[0][2] = 3;
  A.matrix[1][0] = 0, A.matrix[1][1] = 4, A.matrix[1][2] = 5;
  A.matrix[2][0] = 0, A.matrix[2][1] = 0, A.matrix[2][2] = 6;
  B.matrix[0][0] = 1, B.matrix[0][1] = 0, B.matrix[0][2] = 0;
  B.matrix[1][0] = 2, B.matrix[1][1] = 0, B.matrix[1][2] = 0;
  B.matrix[2][0] = 3, B.matrix[2][1] = 4, B.matrix[2][2] = 1;
  ck_assert_int_eq(s21_sum_matrix(&A, &B, &result), OK);
  eq_matrix.matrix[0][0] = 2, eq_matrix.matrix[0][1] = 2,
  eq_matrix.matrix[0][2] = 3;
  eq_matrix.matrix[1][0] = 2, eq_matrix.matrix[1][1] = 4,
  eq_matrix.matrix[1][2] = 5;
  eq_matrix.matrix[2][0] = 3, eq_matrix.matrix[2][1] = 4,
  eq_matrix.matrix[2][2] = 7;
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_sub_matrix_1) {
  // failure error with wrong matrices
  matrix_t A = {};
  matrix_t B = {};
  ck_assert_int_eq(s21_sub_matrix(&A, &B, NULL), ERROR_CORRECT);
}
END_TEST

START_TEST(s21_sub_matrix_2) {
  // failure with different dimensions of matrices
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  s21_create_matrix(4, 4, &A);
  s21_create_matrix(5, 5, &B);
  ck_assert_int_eq(s21_sub_matrix(&A, &B, &result), ERROR_CALC);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
}
END_TEST

START_TEST(s21_sub_matrix_3) {
  // failure with non-finite value
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  initialize_matrix(&A, 1, 1);
  initialize_matrix(&B, 1, 1);
  B.matrix[3][3] = INFINITY;
  ck_assert_int_eq(s21_sub_matrix(&A, &B, &result), ERROR_CALC);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
}
END_TEST

START_TEST(s21_sub_matrix_4) {
  // sucess with initialized values
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  s21_create_matrix(5, 5, &eq_matrix);
  initialize_matrix(&A, 1, 1);
  initialize_matrix(&B, 1, 1);
  ck_assert_int_eq(s21_sub_matrix(&A, &B, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_sub_matrix_5) {
  // sucess with uninitialized values
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(5, 5, &A);
  s21_create_matrix(5, 5, &B);
  s21_create_matrix(5, 5, &eq_matrix);
  ck_assert_int_eq(s21_sub_matrix(&A, &B, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_sub_matrix_6) {
  // sucess with task refence
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &B);
  s21_create_matrix(3, 3, &eq_matrix);
  A.matrix[0][0] = 1, A.matrix[0][1] = 2, A.matrix[0][2] = 3;
  A.matrix[1][0] = 0, A.matrix[1][1] = 4, A.matrix[1][2] = 5;
  A.matrix[2][0] = 0, A.matrix[2][1] = 0, A.matrix[2][2] = 6;
  B.matrix[0][0] = 1, B.matrix[0][1] = 0, B.matrix[0][2] = 0;
  B.matrix[1][0] = 2, B.matrix[1][1] = 0, B.matrix[1][2] = 0;
  B.matrix[2][0] = 3, B.matrix[2][1] = 4, B.matrix[2][2] = 1;
  ck_assert_int_eq(s21_sub_matrix(&A, &B, &result), OK);
  eq_matrix.matrix[0][0] = 0, eq_matrix.matrix[0][1] = 2,
  eq_matrix.matrix[0][2] = 3;
  eq_matrix.matrix[1][0] = -2, eq_matrix.matrix[1][1] = 4,
  eq_matrix.matrix[1][2] = 5;
  eq_matrix.matrix[2][0] = -3, eq_matrix.matrix[2][1] = -4,
  eq_matrix.matrix[2][2] = 5;
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_mult_number_1) {
  // failure with INCORRECT_MATRIX
  matrix_t A = {};
  double number = 3.14;
  s21_create_matrix(3, 3, &A);
  initialize_matrix(&A, 1, 1);
  ck_assert_int_eq(s21_mult_number(&A, number, NULL), ERROR_CORRECT);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_mult_number_2) {
  // failure with non-finite input double
  matrix_t A = {};
  matrix_t result = {};
  double number = INFINITY;
  s21_create_matrix(3, 3, &A);
  initialize_matrix(&A, 1, 1);
  ck_assert_int_eq(s21_mult_number(&A, number, &result), ERROR_CALC);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_mult_number_3) {
  // failure with with the resulting non-finite
  matrix_t A = {};
  matrix_t result = {};
  double number = 3;
  s21_create_matrix(3, 3, &A);
  initialize_matrix(&A, 1, 1);
  A.matrix[2][2] = INFINITY;
  ck_assert_int_eq(s21_mult_number(&A, number, &result), ERROR_CALC);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
}
END_TEST

START_TEST(s21_mult_number_4) {
  // success with uninitialized values
  matrix_t A = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  double number = 3;
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &eq_matrix);
  ck_assert_int_eq(s21_mult_number(&A, number, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_mult_number_5) {
  // success with initialized values
  matrix_t A = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  double number = 3;
  s21_create_matrix(3, 3, &A);
  initialize_matrix(&A, 1, 1);
  s21_create_matrix(3, 3, &eq_matrix);
  initialize_matrix(&eq_matrix, 3, 3);
  ck_assert_int_eq(s21_mult_number(&A, number, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_mult_number_6) {
  // success with task reference values
  matrix_t A = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  double number = 2;
  s21_create_matrix(3, 3, &A);
  A.matrix[0][0] = 1, A.matrix[0][1] = 2, A.matrix[0][2] = 3;
  A.matrix[1][0] = 0, A.matrix[1][1] = 4, A.matrix[1][2] = 2;
  A.matrix[2][0] = 2, A.matrix[2][1] = 3, A.matrix[2][2] = 4;
  s21_create_matrix(3, 3, &eq_matrix);
  eq_matrix.matrix[0][0] = 2, eq_matrix.matrix[0][1] = 4,
  eq_matrix.matrix[0][2] = 6;
  eq_matrix.matrix[1][0] = 0, eq_matrix.matrix[1][1] = 8,
  eq_matrix.matrix[1][2] = 4;
  eq_matrix.matrix[2][0] = 4, eq_matrix.matrix[2][1] = 6,
  eq_matrix.matrix[2][2] = 8;
  ck_assert_int_eq(s21_mult_number(&A, number, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_mult_matrix_1) {
  // failure with INCORRECT_MATRIX
  matrix_t A = {};
  s21_create_matrix(3, 3, &A);
  initialize_matrix(&A, 1, 1);
  ck_assert_int_eq(s21_mult_matrix(&A, NULL, NULL), ERROR_CORRECT);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_mult_matrix_2) {
  // failure with with the resulting non-finite
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &B);
  initialize_matrix(&A, 1, 1);
  B.matrix[2][2] = INFINITY;
  ck_assert_int_eq(s21_mult_matrix(&A, &B, &result), ERROR_CALC);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
}
END_TEST

START_TEST(s21_mult_matrix_3) {
  // failure with different dimensions of matrices
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  s21_create_matrix(3, 2, &A);
  s21_create_matrix(3, 2, &B);
  ck_assert_int_eq(s21_mult_matrix(&A, &B, &result), ERROR_CALC);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
}
END_TEST

START_TEST(s21_mult_matrix_4) {
  // success with uninitialized values
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &B);
  s21_create_matrix(3, 3, &eq_matrix);
  ck_assert_int_eq(s21_mult_matrix(&A, &B, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_mult_matrix_5) {
  // success with initialized values
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(3, 3, &A);
  initialize_matrix(&A, 1, 1);
  s21_create_matrix(3, 3, &B);
  initialize_matrix(&B, 1, 1);
  s21_create_matrix(3, 3, &eq_matrix);
  eq_matrix.matrix[0][0] = 30, eq_matrix.matrix[0][1] = 36,
  eq_matrix.matrix[0][2] = 42;
  eq_matrix.matrix[1][0] = 66, eq_matrix.matrix[1][1] = 81,
  eq_matrix.matrix[1][2] = 96;
  eq_matrix.matrix[2][0] = 102, eq_matrix.matrix[2][1] = 126,
  eq_matrix.matrix[2][2] = 150;
  ck_assert_int_eq(s21_mult_matrix(&A, &B, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_mult_matrix_6) {
  // success with task reference values
  matrix_t A = {};
  matrix_t B = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(3, 2, &A);
  A.matrix[0][0] = 1, A.matrix[0][1] = 4;
  A.matrix[1][0] = 2, A.matrix[1][1] = 5;
  A.matrix[2][0] = 3, A.matrix[2][1] = 6;
  s21_create_matrix(2, 3, &B);
  B.matrix[0][0] = 1, B.matrix[0][1] = -1, B.matrix[0][2] = 1;
  B.matrix[1][0] = 2, B.matrix[1][1] = 3, B.matrix[1][2] = 4;
  s21_create_matrix(3, 3, &eq_matrix);
  eq_matrix.matrix[0][0] = 9, eq_matrix.matrix[0][1] = 11,
  eq_matrix.matrix[0][2] = 17;
  eq_matrix.matrix[1][0] = 12, eq_matrix.matrix[1][1] = 13,
  eq_matrix.matrix[1][2] = 22;
  eq_matrix.matrix[2][0] = 15, eq_matrix.matrix[2][1] = 15,
  eq_matrix.matrix[2][2] = 27;
  ck_assert_int_eq(s21_mult_matrix(&A, &B, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&B);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_transpose_1) {
  // failure with INCORRECT_MATRIX
  matrix_t A = {};
  matrix_t result = {};
  ck_assert_int_eq(s21_transpose(&A, &result), ERROR_CORRECT);
}
END_TEST

START_TEST(s21_transpose_2) {
  // success with unininitialized matrix 3x2
  matrix_t A = {};
  matrix_t result = {};
  s21_create_matrix(3, 2, &A);
  ck_assert_int_eq(s21_transpose(&A, &result), OK);
  ck_assert_int_eq(result.rows, 2);
  ck_assert_int_eq(result.columns, 3);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
}
END_TEST

START_TEST(s21_transpose_3) {
  // success with unininitialized matrix 2x3
  matrix_t A = {};
  matrix_t result = {};
  s21_create_matrix(2, 3, &A);
  ck_assert_int_eq(s21_transpose(&A, &result), OK);
  ck_assert_int_eq(result.rows, 3);
  ck_assert_int_eq(result.columns, 2);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
}
END_TEST

START_TEST(s21_transpose_4) {
  // success with initialized matrix 2x3
  matrix_t A = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(2, 3, &A);
  s21_create_matrix(3, 2, &eq_matrix);
  initialize_matrix(&A, 1, 1);
  ck_assert_int_eq(s21_transpose(&A, &result), OK);
  eq_matrix.matrix[0][0] = 1, eq_matrix.matrix[0][1] = 4;
  eq_matrix.matrix[1][0] = 2, eq_matrix.matrix[1][1] = 5;
  eq_matrix.matrix[2][0] = 3, eq_matrix.matrix[2][1] = 6;
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  ck_assert_int_eq(result.rows, 3);
  ck_assert_int_eq(result.columns, 2);
  s21_remove_matrix(&A);
  s21_remove_matrix(&eq_matrix);
  s21_remove_matrix(&result);
}
END_TEST

START_TEST(s21_transpose_5) {
  // success with task reference values and 3x2 matrix
  matrix_t A = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(3, 2, &A);
  s21_create_matrix(2, 3, &eq_matrix);
  A.matrix[0][0] = 1, A.matrix[0][1] = 4;
  A.matrix[1][0] = 2, A.matrix[1][1] = 5;
  A.matrix[2][0] = 3, A.matrix[2][1] = 6;
  ck_assert_int_eq(s21_transpose(&A, &result), OK);
  eq_matrix.matrix[0][0] = 1, eq_matrix.matrix[0][1] = 2,
  eq_matrix.matrix[0][2] = 3;
  eq_matrix.matrix[1][0] = 4, eq_matrix.matrix[1][1] = 5,
  eq_matrix.matrix[1][2] = 6;
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  ck_assert_int_eq(result.rows, 2);
  ck_assert_int_eq(result.columns, 3);
  s21_remove_matrix(&A);
  s21_remove_matrix(&eq_matrix);
  s21_remove_matrix(&result);
}
END_TEST

START_TEST(s21_calc_complements_1) {
  // failure with INCORRECT_MATRIX
  matrix_t A = {};
  s21_create_matrix(3, 3, &A);
  ck_assert_int_eq(s21_calc_complements(&A, NULL), ERROR_CORRECT);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_calc_complements_2) {
  // failure with vector matrix (rows or cols == 1)
  matrix_t A = {};
  matrix_t result = {};
  s21_create_matrix(1, 3, &A);
  initialize_matrix(&A, 1, 3);
  ck_assert_int_eq(s21_calc_complements(&A, &result), ERROR_CALC);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_calc_complements_3) {
  // success with task reference values
  matrix_t A = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &eq_matrix);
  A.matrix[0][0] = 1, A.matrix[0][1] = 2, A.matrix[0][2] = 3;
  A.matrix[1][0] = 0, A.matrix[1][1] = 4, A.matrix[1][2] = 2;
  A.matrix[2][0] = 5, A.matrix[2][1] = 2, A.matrix[2][2] = 1;
  ck_assert_int_eq(s21_calc_complements(&A, &result), OK);
  eq_matrix.matrix[0][0] = 0, eq_matrix.matrix[0][1] = 10,
  eq_matrix.matrix[0][2] = -20;
  eq_matrix.matrix[1][0] = 4, eq_matrix.matrix[1][1] = -14,
  eq_matrix.matrix[1][2] = 8;
  eq_matrix.matrix[2][0] = -8, eq_matrix.matrix[2][1] = -2,
  eq_matrix.matrix[2][2] = 4;
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_determinant_1) {
  // failure with INCORRECT_MATRIX
  matrix_t A = {};
  double det = 0;
  ck_assert_int_eq(s21_determinant(&A, &det), ERROR_CORRECT);
}
END_TEST

START_TEST(s21_determinant_2) {
  // failure with non-square matrix
  matrix_t A = {};
  double det = 0;
  s21_create_matrix(3, 2, &A);
  initialize_matrix(&A, 1, 1);
  ck_assert_int_eq(s21_determinant(&A, &det), ERROR_CALC);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_determinant_3) {
  // success with task reference values
  matrix_t A = {};
  double det = 0;
  s21_create_matrix(3, 3, &A);
  initialize_matrix(&A, 1, 1);
  ck_assert_int_eq(s21_determinant(&A, &det), OK);
  ck_assert_double_eq(det, 0);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_determinant_4) {
  // success with 2x2 matrix
  matrix_t A = {};
  double det = 0;
  s21_create_matrix(2, 2, &A);
  initialize_matrix(&A, 3, 3);
  ck_assert_int_eq(s21_determinant(&A, &det), OK);
  ck_assert_double_eq(det, -18);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_determinant_5) {
  // success with 1x1 matrix
  matrix_t A = {};
  double det = 0;
  s21_create_matrix(1, 1, &A);
  A.matrix[0][0] = 21;
  ck_assert_int_eq(s21_determinant(&A, &det), OK);
  ck_assert_double_eq(det, 21);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_inverse_matrix_1) {
  // failure with INCORRECT_MATRIX
  matrix_t A = {};
  matrix_t result = {};
  ck_assert_int_eq(s21_inverse_matrix(&A, &result), ERROR_CORRECT);
}
END_TEST

START_TEST(s21_inverse_matrix_2) {
  // failure when matrix has determinant equal to zero
  matrix_t A = {};
  matrix_t result = {};
  s21_create_matrix(3, 3, &A);
  initialize_matrix(&A, 1, 1);
  ck_assert_int_eq(s21_inverse_matrix(&A, &result), ERROR_CALC);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_inverse_matrix_3) {
  // failure with non-square matrix
  matrix_t A = {};
  matrix_t result = {};
  s21_create_matrix(5, 3, &A);
  initialize_matrix(&A, 1, 1);
  ck_assert_int_eq(s21_inverse_matrix(&A, &result), ERROR_CALC);
  s21_remove_matrix(&A);
}
END_TEST

START_TEST(s21_inverse_matrix_4) {
  // success matrix 1x1
  matrix_t A = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(1, 1, &A);
  s21_create_matrix(1, 1, &eq_matrix);
  A.matrix[0][0] = 21;
  eq_matrix.matrix[0][0] = 1.0 / 21.0;
  ck_assert_int_eq(s21_inverse_matrix(&A, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

START_TEST(s21_inverse_matrix_5) {
  // success with task reference values
  matrix_t A = {};
  matrix_t result = {};
  matrix_t eq_matrix = {};
  s21_create_matrix(3, 3, &A);
  s21_create_matrix(3, 3, &eq_matrix);
  A.matrix[0][0] = 2, A.matrix[0][1] = 5, A.matrix[0][2] = 7;
  A.matrix[1][0] = 6, A.matrix[1][1] = 3, A.matrix[1][2] = 4;
  A.matrix[2][0] = 5, A.matrix[2][1] = -2, A.matrix[2][2] = -3;
  eq_matrix.matrix[0][0] = 1, eq_matrix.matrix[0][1] = -1,
  eq_matrix.matrix[0][2] = 1;
  eq_matrix.matrix[1][0] = -38, eq_matrix.matrix[1][1] = 41,
  eq_matrix.matrix[1][2] = -34;
  eq_matrix.matrix[2][0] = 27, eq_matrix.matrix[2][1] = -29,
  eq_matrix.matrix[2][2] = 24;
  ck_assert_int_eq(s21_inverse_matrix(&A, &result), OK);
  ck_assert_int_eq(s21_eq_matrix(&result, &eq_matrix), SUCCESS);
  s21_remove_matrix(&A);
  s21_remove_matrix(&result);
  s21_remove_matrix(&eq_matrix);
}
END_TEST

Suite *s21_matrix_suite(void) {
  Suite *s = suite_create("s21_matrix_suite");
  TCase *tc = tcase_create("tc_s21_matrix_suite");

  tcase_add_test(tc, create_matrix);
  tcase_add_test(tc, arithmetic);
  tcase_add_test(tc, calc_complements);
  tcase_add_test(tc, transpose);
  tcase_add_test(tc, test_determinant);
  tcase_add_test(tc, inverse_matrix);
  tcase_add_test(tc, test_NULLS);
  tcase_add_test(tc, eq_matrix);
  tcase_add_test(tc, s21_create_matrix_1);
  tcase_add_test(tc, s21_create_matrix_2);
  tcase_add_test(tc, s21_create_matrix_3);
  tcase_add_test(tc, s21_remove_matrix_1);
  tcase_add_test(tc, s21_remove_matrix_2);
  tcase_add_test(tc, s21_remove_matrix_3);
  tcase_add_test(tc, s21_eq_matrix_1);
  tcase_add_test(tc, s21_eq_matrix_2);
  tcase_add_test(tc, s21_eq_matrix_3);
  tcase_add_test(tc, s21_eq_matrix_4);
  tcase_add_test(tc, s21_eq_matrix_5);
  tcase_add_test(tc, s21_eq_matrix_6);
  tcase_add_test(tc, s21_sum_matrix_1);
  tcase_add_test(tc, s21_sum_matrix_2);
  tcase_add_test(tc, s21_sum_matrix_3);
  tcase_add_test(tc, s21_sum_matrix_4);
  tcase_add_test(tc, s21_sum_matrix_5);
  tcase_add_test(tc, s21_sum_matrix_6);
  tcase_add_test(tc, s21_sub_matrix_1);
  tcase_add_test(tc, s21_sub_matrix_2);
  tcase_add_test(tc, s21_sub_matrix_3);
  tcase_add_test(tc, s21_sub_matrix_4);
  tcase_add_test(tc, s21_sub_matrix_5);
  tcase_add_test(tc, s21_sub_matrix_6);
  tcase_add_test(tc, s21_mult_number_1);
  tcase_add_test(tc, s21_mult_number_2);
  tcase_add_test(tc, s21_mult_number_3);
  tcase_add_test(tc, s21_mult_number_4);
  tcase_add_test(tc, s21_mult_number_5);
  tcase_add_test(tc, s21_mult_number_6);
  tcase_add_test(tc, s21_mult_matrix_1);
  tcase_add_test(tc, s21_mult_matrix_2);
  tcase_add_test(tc, s21_mult_matrix_3);
  tcase_add_test(tc, s21_mult_matrix_4);
  tcase_add_test(tc, s21_mult_matrix_5);
  tcase_add_test(tc, s21_mult_matrix_6);
  tcase_add_test(tc, s21_transpose_1);
  tcase_add_test(tc, s21_transpose_2);
  tcase_add_test(tc, s21_transpose_3);
  tcase_add_test(tc, s21_transpose_4);
  tcase_add_test(tc, s21_transpose_5);
  tcase_add_test(tc, s21_calc_complements_1);
  tcase_add_test(tc, s21_calc_complements_2);
  tcase_add_test(tc, s21_calc_complements_3);
  tcase_add_test(tc, s21_determinant_1);
  tcase_add_test(tc, s21_determinant_2);
  tcase_add_test(tc, s21_determinant_3);
  tcase_add_test(tc, s21_determinant_4);
  tcase_add_test(tc, s21_determinant_5);
  tcase_add_test(tc, s21_inverse_matrix_1);
  tcase_add_test(tc, s21_inverse_matrix_2);
  tcase_add_test(tc, s21_inverse_matrix_3);
  tcase_add_test(tc, s21_inverse_matrix_4);
  tcase_add_test(tc, s21_inverse_matrix_5);

  suite_add_tcase(s, tc);

  return s;
}
