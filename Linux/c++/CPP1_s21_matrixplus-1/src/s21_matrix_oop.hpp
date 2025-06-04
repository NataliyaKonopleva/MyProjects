#ifndef __S21_MATRIX_OOP_H__
#define __S21_MATRIX_OOP_H__

#include <algorithm>
#include <cmath>
#include <cstring>
#include <iostream>

#define EPS 1E-7

class S21Matrix {
 private:
  // attributes
  int _rows, _cols;  // rows and columns attributes
  double* _p;        // pointer to the memory where the matrix will be allocated

 public:
  S21Matrix();                    // default constructor
  S21Matrix(int rows, int cols);  // parameterized constructor
  S21Matrix(const S21Matrix& o);  // copy costructor
  S21Matrix(S21Matrix&& o);       // move costructor
  ~S21Matrix();                   // destructor

  // some operators overloads
  S21Matrix& operator=(const S21Matrix& o);
  S21Matrix& operator+=(const S21Matrix& o);
  S21Matrix operator+(const S21Matrix& o);
  S21Matrix& operator-=(const S21Matrix& o);
  S21Matrix operator-(const S21Matrix& o);
  S21Matrix operator*(const double num);
  S21Matrix operator*(const S21Matrix& o);
  S21Matrix& operator*=(const S21Matrix& o);
  S21Matrix& operator*=(const double num);
  bool operator==(const S21Matrix& o) const;
  double& operator()(int row, int col);
  const double& operator()(int row, int col) const;

  // some public methods
  bool EqMatrix(const S21Matrix& o) const;
  void SumMatrix(const S21Matrix& o);
  void SubMatrix(const S21Matrix& o);
  void MulNumber(const double num);
  void MulMatrix(const S21Matrix& o);
  S21Matrix Transpose();
  S21Matrix CalcComplements();
  double Determinant();
  S21Matrix InverseMatrix();

  //  accessors && mutators
  int GetRows() const;
  int GetColums() const;
  void SetRows(int rows);
  void SetColums(int cols);

  //  helper function
  double s21_determinant();
  S21Matrix s21_create_submatrix(int row, int col);
  double s21_minor(int row, int col);
};

#endif