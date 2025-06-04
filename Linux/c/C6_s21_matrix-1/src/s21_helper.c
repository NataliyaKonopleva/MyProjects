#include "s21_helper.h"

int is_correct_matrix(matrix_t *A) {
  return (A == NULL || A->matrix == NULL || A->rows <= 0 || A->columns <= 0)
             ? ERROR_CORRECT
             : OK;
}

int is_size_eq_matrix(matrix_t *A, matrix_t *B) {
  int out = (is_correct_matrix(A) || is_correct_matrix(B)) ? ERROR_CORRECT : OK;
  if (!out) {
    out = (A->rows != B->rows || A->columns != B->columns) ? ERROR_CALC : OK;
  }
  return out;
}

int is_square_matrix(matrix_t *A) {
  int out = is_correct_matrix(A);
  if (!out) {
    out = (A->rows != A->columns) ? ERROR_CALC : OK;
  }
  return out;
}

double determinant(matrix_t *A) {
  int n = A->rows, out = OK;
  double det = 0;
  if (out == OK && n == 1) {
    det = A->matrix[0][0];
  } else if (out == OK && n == 2) {
    det = A->matrix[0][0] * A->matrix[1][1] - A->matrix[0][1] * A->matrix[1][0];
    // printf("det: %lf\n", det);
  } else {
    for (int i = 0; out == OK && i < n; i++) {
      matrix_t C = {};
      out = create_submatrix(0, i, A, &C);
      if (out == OK) {
        det += A->matrix[0][i] * pow(-1, i) * determinant(&C);
        s21_remove_matrix(&C);
      }
    }
  }
  return out == OK ? det : 0;
}

double minor(matrix_t *A, int row, int col) {
  double minor = 0;
  matrix_t C = {};
  int out = create_submatrix(row, col, A, &C);
  if (!out) {
    minor = determinant(&C);
    s21_remove_matrix(&C);
  }

  return minor;
}

int create_submatrix(int row, int col, matrix_t *A, matrix_t *submatrix) {
  int n = A->rows;
  int out = s21_create_matrix(n - 1, n - 1, submatrix);
  if (!out) {
    int submatrix_row = 0;
    for (int i = 0; i < n; i++) {
      if (i == row) {
        continue;
      }
      int submatrix_col = 0;
      for (int j = 0; j < n; j++) {
        if (j == col) {
          continue;
        }
        submatrix->matrix[submatrix_row][submatrix_col] = A->matrix[i][j];
        submatrix_col++;
      }
      submatrix_row++;
    }
  }
  return out;
}

void initialize_matrix(matrix_t *A, double start_value, double iteration_step) {
  if (A != NULL && A->matrix != NULL) {
    double value = start_value;
    for (int i = 0; i < A->rows; i++) {
      for (int j = 0; j < A->columns; j++) {
        A->matrix[i][j] = value;
        value += iteration_step;
      }
    }
  }
}
