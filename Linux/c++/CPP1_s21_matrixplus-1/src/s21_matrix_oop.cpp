#include "s21_matrix_oop.hpp"

S21Matrix::S21Matrix() : _rows(1), _cols(1) {
  _p = new double[_rows * _cols]();
}

S21Matrix::S21Matrix(int rows, int cols) : _rows(rows), _cols(cols) {
  if (_rows < 1 || _cols < 1)
    throw std::out_of_range(
        "Ошибка: Строк, стобцов в матрице должно быть > 0.");
  _p = new double[_rows * _cols]();
}

S21Matrix::S21Matrix(const S21Matrix& o) : _rows(o._rows), _cols(o._cols) {
  _p = new double[_rows * _cols]();
  std::memcpy(_p, o._p, o._rows * o._cols * sizeof(double));
}

S21Matrix::S21Matrix(S21Matrix&& o) : _rows(o._rows), _cols(o._cols), _p(o._p) {
  o._p = nullptr;
  o._rows = 0;
  o._cols = 0;
}

S21Matrix::~S21Matrix() {
  if (_p) {
    delete[] _p;
  }
}

bool S21Matrix::EqMatrix(const S21Matrix& o) const {
  bool res = true;
  if (_rows != o._rows || _cols != o._cols) res = false;
  int i = 0;
  while (i < _rows * _cols && res) {
    if (fabs(_p[i] - o._p[i]) >= EPS) res = false;
    ++i;
  }
  return res;
}

void S21Matrix::SumMatrix(const S21Matrix& o) {
  if (_rows != o._rows || _cols != o._cols) {
    throw std::logic_error("Ошибка: Различная размерность матриц.");
  }
  for (auto i = 0; i < _rows * _cols; i++) {
    _p[i] = _p[i] + o._p[i];
  }
}

void S21Matrix::SubMatrix(const S21Matrix& o) {
  if (_rows != o._rows || _cols != o._cols) {
    throw std::logic_error("Ошибка: Различная размерность матриц.");
  }
  for (auto i = 0; i < _rows * _cols; i++) {
    _p[i] = _p[i] - o._p[i];
  }
}

void S21Matrix::MulNumber(const double num) {
  for (auto i = 0; i < _rows * _cols; i++) {
    _p[i] = _p[i] * num;
  }
}

void S21Matrix::MulMatrix(const S21Matrix& o) {
  if (_cols != o._rows) {
    throw std::logic_error(
        "Ошибка: Число столбцов первой матрицы не равно числу строк второй "
        "матрицы.");
  }
  S21Matrix tmp(_rows, o._cols);
  for (int i = 0; i < _rows; ++i) {
    for (int j = 0; j < o._cols; ++j) {
      double sum = 0.0;
      for (int k = 0; k < _cols; ++k) {
        sum += (*this)(i, k) * o(k, j);
      }
      tmp(i, j) = sum;
    }
  }
  std::swap(_p, tmp._p);
  _cols = tmp._cols;
}

S21Matrix S21Matrix::Transpose() {
  S21Matrix tmp(_cols, _rows);
  for (int i = 0; i < tmp._rows; ++i) {
    for (int j = 0; j < tmp._cols; ++j) {
      tmp(i, j) = (*this)(j, i);
    }
  }
  return tmp;
}

double S21Matrix::Determinant() {
  if (_cols != _rows) {
    throw std::logic_error("Ошибка: Матрица не является квадратной.");
  }
  return s21_determinant();
}

S21Matrix S21Matrix::CalcComplements() {
  if (_cols != _rows) {
    throw std::logic_error("Ошибка: Матрица не является квадратной.");
  }
  int n = _rows;
  S21Matrix result(n, n);
  if (n > 1) {
    for (int i = 0; i < n; ++i)
      for (int j = 0; j < n; ++j) {
        result(i, j) = pow(-1, i + j) * this->s21_minor(i, j);
      }
  } else {
    result(0, 0) = 1;
  }
  return result;
}

S21Matrix S21Matrix::InverseMatrix() {
  double det = this->Determinant();
  S21Matrix result;
  if (fabs(det) < EPS) {
    throw std::logic_error("Ошибка: Определитель матрицы равен 0.");
  }
  if (_rows == 1) {
    result(0, 0) = 1 / (*this)(0, 0);
  } else {
    S21Matrix A_complements = this->CalcComplements();
    S21Matrix A_transpone = A_complements.Transpose();
    result = A_transpone * (1 / det);
  }

  return result;
}

// operators overload

S21Matrix& S21Matrix::operator=(const S21Matrix& o) {
  if (this != &o) {
    S21Matrix temp(o);
    std::swap(_rows, temp._rows);
    std::swap(_cols, temp._cols);
    std::swap(_p, temp._p);
  }
  return *this;
}

S21Matrix S21Matrix::operator+(const S21Matrix& o) {
  if (_rows != o._rows || _cols != o._cols) {
    throw std::logic_error("Ошибка: Различная размерность матриц.");
  }
  S21Matrix temp(*this);
  temp.SumMatrix(o);
  return temp;
}

S21Matrix S21Matrix::operator-(const S21Matrix& o) {
  if (_rows != o._rows || _cols != o._cols) {
    throw std::logic_error("Ошибка: Различная размерность матриц.");
  }
  S21Matrix temp(*this);
  temp.SubMatrix(o);
  return temp;
}

S21Matrix& S21Matrix::operator+=(const S21Matrix& o) {
  if (_rows != o._rows || _cols != o._cols) {
    throw std::logic_error("Ошибка: Различная размерность матриц.");
  }
  this->SumMatrix(o);
  return *this;
}

S21Matrix& S21Matrix::operator-=(const S21Matrix& o) {
  if (_rows != o._rows || _cols != o._cols) {
    throw std::logic_error("Ошибка: Различная размерность матриц.");
  }
  this->SubMatrix(o);
  return *this;
}

bool S21Matrix::operator==(const S21Matrix& o) const { 
  return this->EqMatrix(o); }

S21Matrix S21Matrix::operator*(const double num) {
  S21Matrix temp(*this);
  temp.MulNumber(num);
  return temp;
}

S21Matrix& S21Matrix::operator*=(const double num) {
  this->MulNumber(num);
  return *this;
}

S21Matrix S21Matrix::operator*(const S21Matrix& o) {
  if (_cols != o._rows) {
    throw std::logic_error(
        "Ошибка: Число столбцов первой матрицы не равно числу строк второй "
        "матрицы.");
  }
  S21Matrix temp(*this);
  temp.MulMatrix(o);
  return temp;
}

S21Matrix& S21Matrix::operator*=(const S21Matrix& o) {
  if (_cols != o._rows) {
    throw std::logic_error(
        "Ошибка: Число столбцов первой матрицы не равно числу строк второй "
        "матрицы.");
  }
  this->MulMatrix(o);
  return *this;
}

double& S21Matrix::operator()(int row, int col) {
  if (row < 0 || row >= _rows || col < 0 || col >= _cols) {
    throw std::out_of_range("Ошибка: Индекс за пределами матрицы.");
  }
  return _p[row * _cols + col];
}

const double& S21Matrix::operator()(int row, int col) const {
  if (row < 0 || row >= _rows || col < 0 || col >= _cols) {
    throw std::out_of_range("Ошибка: Индекс за пределами матрицы.");
  }
  return _p[row * _cols + col];
}

//  Accessors && Mutators

int S21Matrix::GetRows() const { return this->_rows; }

int S21Matrix::GetColums() const { return this->_cols; }

void S21Matrix::SetRows(int rows) {
  if (rows < 1) {
    throw std::out_of_range(
        "Ошибка: Строк, стобцов в матрице должно быть > 0.");
  } else {
    double* tmp = new double[rows * _cols]();
    if (rows > _rows) {
      std::memcpy(tmp, _p, _rows * _cols * sizeof(double));
    } else {
      std::memcpy(tmp, _p, rows * _cols * sizeof(double));
    }
    _rows = rows;
    std::swap(_p, tmp);
    delete[] tmp;
  }
}

void S21Matrix::SetColums(int cols) {
  if (cols < 1) {
    throw std::out_of_range(
        "Ошибка: Строк, стобцов в матрице должно быть > 0.");
  } else {
    S21Matrix tmp(_rows, cols);
    if (cols > _cols) {
      for (int i = 0; i < _rows; ++i)
        for (int j = 0; j < _cols; ++j) tmp(i, j) = (*this)(i, j);
    } else {
      for (int i = 0; i < _rows; ++i)
        for (int j = 0; j < cols; ++j) tmp(i, j) = (*this)(i, j);
    }
    _cols = cols;
    std::swap(_p, tmp._p);
  }
}

// Helper functions

double S21Matrix::s21_determinant() {
  double det = 0;
  if (_rows == 1) {
    det = (*this)(0, 0);
  } else if (_rows == 2) {
    det = (*this)(0, 0) * (*this)(1, 1) - (*this)(0, 1) * (*this)(1, 0);
  } else {
    for (int i = 0; i < _rows; ++i) {
      S21Matrix C = this->s21_create_submatrix(0, i);
      det += (*this)(0, i) * pow(-1, i) * C.s21_determinant();
    }
  }
  return det;
}

S21Matrix S21Matrix::s21_create_submatrix(int row, int col) {
  int n = _rows;
  S21Matrix submatrix(n - 1, n - 1);
  int submatrix_row = 0;
  for (int i = 0; i < n; ++i) {
    if (i == row) {
      continue;
    }
    int submatrix_col = 0;
    for (int j = 0; j < n; ++j) {
      if (j == col) {
        continue;
      }
      submatrix(submatrix_row, submatrix_col) = (*this)(i, j);
      submatrix_col++;
    }
    submatrix_row++;
  }
  return submatrix;
}

double S21Matrix::s21_minor(int row, int col) {
  double minor = 0;
  S21Matrix C(this->s21_create_submatrix(row, col));
  minor = C.s21_determinant();
  return minor;
}