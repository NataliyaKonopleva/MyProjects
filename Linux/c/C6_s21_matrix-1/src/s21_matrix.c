#include "s21_matrix.h"

#include "s21_helper.h"

int s21_create_matrix(int rows, int columns, matrix_t *result) {
  int out = OK;
  if (rows <= 0 || columns <= 0 || result == NULL) {
    out = ERROR_CORRECT;
    result = NULL;
  }
  if (!out) {
    result->rows = rows;
    result->columns = columns;
    result->matrix = (double **)calloc(rows, sizeof(double *));
    if (result->matrix == NULL) {
      out = ERROR_CORRECT;
    } else {
      for (int i = 0; out == OK && i < rows; i++) {
        result->matrix[i] = (double *)calloc(columns, sizeof(double));
        if (result->matrix[i] == NULL) {
          out = ERROR_CORRECT;
        }
      }
    }
  }
  return out;
}

void s21_remove_matrix(matrix_t *A) {
  if (A != NULL && A->matrix != NULL) {
    for (int i = 0; i < A->rows; i++) {
      free(A->matrix[i]);
    }
    free(A->matrix);
    A->matrix = NULL;
  }
}

int s21_eq_matrix(matrix_t *A, matrix_t *B) {
  int out = is_size_eq_matrix(A, B);
  out = out == OK ? SUCCESS : FAILURE;
  for (int i = 0; out && i < A->rows; i++)
    for (int j = 0; out && j < A->columns; j++)
      if (fabs(A->matrix[i][j] - B->matrix[i][j]) >= EPS) {
        out = FAILURE;
      }
  return out;
}

int s21_sum_matrix(matrix_t *A, matrix_t *B, matrix_t *result) {
  int out = result != NULL ? is_size_eq_matrix(A, B) : ERROR_CORRECT;
  if (out == OK) {
    out = s21_create_matrix(A->rows, A->columns, result);
  }
  for (int i = 0; out == OK && i < A->rows; i++)
    for (int j = 0; out == OK && j < A->columns; j++) {
      result->matrix[i][j] = A->matrix[i][j] + B->matrix[i][j];
      if (isfinite(result->matrix[i][j]) == 0) {
        out = ERROR_CALC;
      }
    }
  return out;
}

int s21_sub_matrix(matrix_t *A, matrix_t *B, matrix_t *result) {
  int out = result != NULL ? is_size_eq_matrix(A, B) : ERROR_CORRECT;
  if (out == OK) {
    out = s21_create_matrix(A->rows, A->columns, result);
  }
  for (int i = 0; out == OK && i < A->rows; i++)
    for (int j = 0; out == OK && j < A->columns; j++) {
      result->matrix[i][j] = A->matrix[i][j] - B->matrix[i][j];
      if (isfinite(result->matrix[i][j]) == 0) {
        out = ERROR_CALC;
      }
    }
  return out;
}

int s21_mult_number(matrix_t *A, double number, matrix_t *result) {
  int out = result != NULL ? is_correct_matrix(A) : ERROR_CORRECT;
  if (out == OK) {
    out = isfinite(number) == 0 ? ERROR_CALC : OK;
  }
  if (out == OK) {
    out = s21_create_matrix(A->rows, A->columns, result);
  }
  for (int i = 0; out == OK && i < A->rows; i++)
    for (int j = 0; out == OK && j < A->columns; j++) {
      result->matrix[i][j] = A->matrix[i][j] * number;
      if (isfinite(result->matrix[i][j]) == 0) {
        out = ERROR_CALC;
      }
    }
  return out;
}

int s21_mult_matrix(matrix_t *A, matrix_t *B, matrix_t *result) {
  int out = (is_correct_matrix(A) || is_correct_matrix(B) || result == NULL)
                ? ERROR_CORRECT
                : OK;
  if (out == OK) {
    out = (A->columns != B->rows) ? ERROR_CALC : OK;
  }
  if (out == OK) {
    int l = A->rows, m = A->columns, n = B->columns;
    out = s21_create_matrix(l, n, result);
    for (int i = 0; out == OK && i < l; i++)
      for (int j = 0; out == OK && j < n; j++) {
        result->matrix[i][j] = 0;
        for (int r = 0; out == OK && r < m; r++) {
          result->matrix[i][j] += A->matrix[i][r] * B->matrix[r][j];
          if (isfinite(result->matrix[i][j]) == 0) {
            out = ERROR_CALC;
          }
        }
      }
  }
  return out;
}

int s21_transpose(matrix_t *A, matrix_t *result) {
  int out = result != NULL ? is_correct_matrix(A) : ERROR_CORRECT;
  if (out == OK) {
    out = s21_create_matrix(A->columns, A->rows, result);
    if (out == OK) {
      for (int i = 0; i < A->columns; i++)
        for (int j = 0; j < A->rows; j++) {
          result->matrix[i][j] = A->matrix[j][i];
        }
    }
  }
  return out;
}

int s21_determinant(matrix_t *A, double *result) {
  int out = (result != NULL) ? is_square_matrix(A) : ERROR_CORRECT;
  if (out == OK) {
    *result = determinant(A);
    if (isfinite(*result) == 0) {
      out = ERROR_CALC;
    }
  }
  return out;
}

int s21_calc_complements(matrix_t *A, matrix_t *result) {
  int out = (result != NULL) ? is_square_matrix(A) : ERROR_CORRECT;
  /* if (out == OK && A->rows == 1) {
    out = ERROR_CALC;
  }*/
  if (out == OK) {
    int n = A->rows;
    out = s21_create_matrix(n, n, result);
    if (out == OK && n > 1) {
      for (int i = 0; out == OK && i < n; i++)
        for (int j = 0; out == OK && j < n; j++) {
          result->matrix[i][j] = pow(-1, i + j) * minor(A, i, j);
          if (isfinite(result->matrix[i][j]) == 0) {
            out = ERROR_CALC;
          }
        }
    }
    if (out == OK && n == 1) {
      result->matrix[0][0] = 1;
    }
  }
  return out;
}

int s21_inverse_matrix(matrix_t *A, matrix_t *result) {
  int out = (result != NULL) ? is_square_matrix(A) : ERROR_CORRECT;
  if (out == OK) {
    double det = 0;
    out = s21_determinant(A, &det);
    if (out == OK && fabs(det) < EPS) {
      out = ERROR_CALC;
    }
    if (out == OK) {
      if (A->rows == 1) {
        out = (fabs(A->matrix[0][0]) >= EPS) ? s21_create_matrix(1, 1, result)
                                             : ERROR_CALC;
        if (out == OK) {
          result->matrix[0][0] = 1 / A->matrix[0][0];
        }
      } else {
        matrix_t A_complements = {};
        out = s21_calc_complements(A, &A_complements);
        if (out == OK) {
          matrix_t A_transpone = {};
          out = s21_transpose(&A_complements, &A_transpone);
          if (out == OK) {
            out = s21_mult_number(&A_transpone, 1 / det, result);
          }
          s21_remove_matrix(&A_transpone);
        }
        s21_remove_matrix(&A_complements);
      }
    }
  }

  return out;
}