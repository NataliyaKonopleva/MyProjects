#include <gtest/gtest.h>

#include "../s21_matrix_oop.hpp"

TEST(Constructor, Subtest_1) {
  S21Matrix matrix;
  ASSERT_EQ(matrix.GetColums(), 1);
  ASSERT_EQ(matrix.GetRows(), 1);
}

TEST(Constructor, Subtest_2) {
  S21Matrix matrix(13, 37);
  ASSERT_EQ(matrix.GetRows(), 13);
  ASSERT_EQ(matrix.GetColums(), 37);
}

TEST(Constructor, Subtest_3) {
  S21Matrix matrix1(2, 2);
  matrix1(0, 0) = 7.09;
  matrix1(0, 1) = 3.99;
  matrix1(1, 0) = 5.96;
  matrix1(1, 1) = 1.55;
  S21Matrix matrix2(matrix1);
  ASSERT_TRUE(matrix1.EqMatrix(matrix2));
}

TEST(Constructor, Subtest_4) {
  EXPECT_THROW(S21Matrix matrix(0, 3), std::out_of_range);
}

TEST(EqMatrix, Subtest_1) {
  S21Matrix matrix1(2, 2);
  S21Matrix matrix2(2, 2);
  matrix1(0, 0) = 7;
  matrix1(0, 1) = 3;
  matrix1(1, 0) = 5;
  matrix1(1, 0) = 1;

  matrix2(0, 0) = 7;
  matrix2(0, 1) = 3;
  matrix2(1, 0) = 5;
  matrix2(1, 0) = 1;

  ASSERT_TRUE(matrix1.EqMatrix(matrix2));
}

TEST(EqMatrix, Subtest_2) {
  S21Matrix matrix1(2, 2);
  S21Matrix matrix2(2, 2);

  matrix1(0, 0) = 7;
  matrix1(0, 1) = 3;
  matrix1(1, 0) = 5;
  matrix1(1, 0) = 1;

  matrix2(0, 0) = 7;
  matrix2(0, 1) = 3;
  matrix2(1, 0) = 5;
  matrix2(1, 0) = 1;

  matrix1(1, 1) -= 1e-3;

  ASSERT_FALSE(matrix1.EqMatrix(matrix2));
}

TEST(EqMatrix, Subtest_3) {
  S21Matrix matrix1(2, 2);
  S21Matrix matrix2(3, 2);

  matrix1(0, 0) = 7;
  matrix1(0, 1) = 3;
  matrix1(1, 0) = 5;
  matrix1(1, 0) = 1;

  matrix2(0, 0) = 7;
  matrix2(0, 1) = 3;
  matrix2(1, 0) = 5;
  matrix2(1, 0) = 1;
  matrix2(2, 0) = 5;
  matrix2(2, 1) = 1;
  ASSERT_FALSE(matrix1.EqMatrix(matrix2));
}

TEST(OperatorEq, Subtest_1) {
  S21Matrix matrix1(2, 2);
  S21Matrix matrix2(2, 2);
  matrix1(0, 0) = 7;
  matrix1(0, 1) = 3;
  matrix1(1, 0) = 5;
  matrix1(1, 0) = 1;

  matrix2(0, 0) = 7;
  matrix2(0, 1) = 3;
  matrix2(1, 0) = 5;
  matrix2(1, 0) = 1;

  ASSERT_TRUE(matrix1 == matrix2);
}

TEST(OperatorEq, Subtest_2) {
  S21Matrix matrix1(2, 2);
  S21Matrix matrix2(2, 2);
  matrix1(0, 0) = 7;
  matrix1(0, 1) = 3;
  matrix1(1, 0) = 5;
  matrix1(1, 0) = 1;

  matrix2(0, 0) = 7;
  matrix2(0, 1) = 3;
  matrix2(1, 0) = 5;
  matrix2(1, 0) = 8;

  ASSERT_FALSE(matrix1 == matrix2);
}

TEST(SumMatrix, Subtest_1) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result(3, 3);
  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;

  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;

  result(0, 0) = 10.2;
  result(0, 1) = 2.4;
  result(0, 2) = 13.4;

  result(1, 0) = (4.8 - 1.6);
  result(1, 1) = 4.9;
  result(1, 2) = -2.1;

  result(2, 0) = (9.4 + 2.2);
  result(2, 1) = (3.5 - 4.9);
  result(2, 2) = 9.5;

  matrix1.SumMatrix(matrix2);
  ASSERT_TRUE(matrix1.EqMatrix(result));
}

TEST(SumMatrix, Subtest_2) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result(3, 3);
  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;

  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;

  result(0, 0) = 10.2;
  result(0, 1) = 2.4;
  result(0, 2) = 13.4;

  result(1, 0) = (4.8 - 1.6);
  result(1, 1) = 4.9;
  result(1, 2) = -2.1;

  result(2, 0) = (9.4 + 2.2);
  result(2, 1) = (3.5 - 4.9);
  result(2, 2) = 9;

  matrix1.SumMatrix(matrix2);
  ASSERT_FALSE(matrix1.EqMatrix(result));
}

TEST(SumMatrix, Subtest_3) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW(matrix1.SumMatrix(matrix2), std::logic_error);
}

TEST(OperatorSum, Subtest_1) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;

  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;

  result1(0, 0) = 10.2;
  result1(0, 1) = 2.4;
  result1(0, 2) = 13.4;

  result1(1, 0) = (4.8 - 1.6);
  result1(1, 1) = 4.9;
  result1(1, 2) = -2.1;

  result1(2, 0) = (9.4 + 2.2);
  result1(2, 1) = (3.5 - 4.9);
  result1(2, 2) = 9.5;

  S21Matrix result2 = matrix1 + matrix2;

  ASSERT_TRUE(result2.EqMatrix(result1));
}

TEST(OperatorSum, Subtest_2) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;

  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;

  result1(0, 0) = 10.2;
  result1(0, 1) = 2.4;
  result1(0, 2) = 13.4;

  result1(1, 0) = (4.8 - 1.6);
  result1(1, 1) = 4.9;
  result1(1, 2) = 2.1;

  result1(2, 0) = (9.4 + 2.2);
  result1(2, 1) = (3.5 - 4.9);
  result1(2, 2) = 9.5;

  S21Matrix result2 = matrix1 + matrix2;

  ASSERT_FALSE(result2.EqMatrix(result1));
}

TEST(OperatorSum, Subtest_3) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;

  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;

  result1(0, 0) = 10.2;
  result1(0, 1) = 2.4;
  result1(0, 2) = 13.4;

  result1(1, 0) = (4.8 - 1.6);
  result1(1, 1) = 4.9;
  result1(1, 2) = -2.1;

  result1(2, 0) = (9.4 + 2.2);
  result1(2, 1) = (3.5 - 4.9);
  result1(2, 2) = 9.5;

  matrix1 += matrix2;

  ASSERT_TRUE(matrix1.EqMatrix(result1));
}

TEST(OperatorSum, Subtest_4) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW((matrix1 + matrix2), std::logic_error);
}

TEST(OperatorSum, Subtest_5) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW((matrix1 += matrix2), std::logic_error);
}

TEST(SubMatrix, Subtest_1) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //.....................
  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;
  //---------------------
  result1(0, 0) = 4.3 - 5.9;
  result1(0, 1) = -1.0 - 3.4;
  result1(0, 2) = 5.7 - 7.7;

  result1(1, 0) = 4.8 - (-1.6);
  result1(1, 1) = -2.0 - 6.9;
  result1(1, 2) = 1.6 - (-3.7);

  result1(2, 0) = (9.4 - 2.2);
  result1(2, 1) = (3.5 - (-4.9));
  result1(2, 2) = 8.4 - 1.1;

  matrix1.SubMatrix(matrix2);

  ASSERT_TRUE(matrix1.EqMatrix(result1));
}

TEST(SubMatrix, Subtest_2) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //.....................
  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;
  //---------------------
  result1(0, 0) = 4.3 - 5.9;
  result1(0, 1) = -1.0 - 3.4;
  result1(0, 2) = 5.7 - 7.7;

  result1(1, 0) = 4.8 - (-1.6);
  result1(1, 1) = -2.0 - 6.9;
  result1(1, 2) = 1.6 - (-3.7);

  result1(2, 0) = (9.4 - 2.2);
  result1(2, 1) = (3.5 - (-4.9));
  result1(2, 2) = 8.4;

  matrix1.SubMatrix(matrix2);

  ASSERT_FALSE(matrix1.EqMatrix(result1));
}

TEST(SubMatrix, Subtest_3) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW(matrix1.SubMatrix(matrix2), std::logic_error);
}

TEST(OperatorSub, Subtest_1) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //.....................
  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;
  //---------------------
  result1(0, 0) = 4.3 - 5.9;
  result1(0, 1) = -1.0 - 3.4;
  result1(0, 2) = 5.7 - 7.7;

  result1(1, 0) = 4.8 - (-1.6);
  result1(1, 1) = -2.0 - 6.9;
  result1(1, 2) = 1.6 - (-3.7);

  result1(2, 0) = (9.4 - 2.2);
  result1(2, 1) = (3.5 - (-4.9));
  result1(2, 2) = 8.4 - 1.1;

  S21Matrix result2 = matrix1 - matrix2;

  ASSERT_TRUE(result2.EqMatrix(result1));
}

TEST(OperatorSub, Subtest_2) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //.....................
  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;
  //---------------------
  result1(0, 0) = 4.3 - 5.9;
  result1(0, 1) = -1.0 - 3.4;
  result1(0, 2) = 5.7 - 7.7;

  result1(1, 0) = 4.8 - (-1.6);
  result1(1, 1) = -2.0 - 6.9;
  result1(1, 2) = 1.6 - (-3.7);

  result1(2, 0) = (9.4 - 2.2);
  result1(2, 1) = (3.5 - (-4.9));
  result1(2, 2) = 8.4;

  S21Matrix result2 = matrix1 - matrix2;

  ASSERT_FALSE(result2.EqMatrix(result1));
}

TEST(OperatorSub, Subtest_3) {
  S21Matrix matrix1(3, 3);
  S21Matrix matrix2(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //.....................
  matrix2(0, 0) = 5.9;
  matrix2(0, 1) = 3.4;
  matrix2(0, 2) = 7.7;

  matrix2(1, 0) = -1.6;
  matrix2(1, 1) = 6.9;
  matrix2(1, 2) = -3.7;

  matrix2(2, 0) = 2.2;
  matrix2(2, 1) = -4.9;
  matrix2(2, 2) = 1.1;
  //---------------------
  result1(0, 0) = 4.3 - 5.9;
  result1(0, 1) = -1.0 - 3.4;
  result1(0, 2) = 5.7 - 7.7;

  result1(1, 0) = 4.8 - (-1.6);
  result1(1, 1) = -2.0 - 6.9;
  result1(1, 2) = 1.6 - (-3.7);

  result1(2, 0) = (9.4 - 2.2);
  result1(2, 1) = (3.5 - (-4.9));
  result1(2, 2) = 8.4 - 1.1;

  matrix1 -= matrix2;

  ASSERT_TRUE(matrix1.EqMatrix(result1));
}

TEST(OperatorSub, Subtest_4) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW((matrix1 - matrix2), std::logic_error);
}

TEST(OperatorSub, Subtest_5) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW((matrix1 -= matrix2), std::logic_error);
}

TEST(MulNumber, Subtest_1) {
  S21Matrix matrix1(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //---------------------
  double num = 1.1;
  result1(0, 0) = 4.3 * num;
  result1(0, 1) = -1.0 * num;
  result1(0, 2) = 5.7 * num;

  result1(1, 0) = 4.8 * num;
  result1(1, 1) = -2.0 * num;
  result1(1, 2) = 1.6 * num;

  result1(2, 0) = 9.4 * num;
  result1(2, 1) = 3.5 * num;
  result1(2, 2) = 8.4 * num;

  matrix1.MulNumber(num);

  ASSERT_TRUE(matrix1.EqMatrix(result1));
}

TEST(MulNumber, Subtest_2) {
  S21Matrix matrix1(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //---------------------
  double num = 1.1;
  result1(0, 0) = 4.3 * num;
  result1(0, 1) = -1.0 * num;
  result1(0, 2) = 5.7 * num;

  result1(1, 0) = 4.8 * num;
  result1(1, 1) = -2.0 * num;
  result1(1, 2) = 1.6 * num;

  result1(2, 0) = 9.4 * num;
  result1(2, 1) = 3.5 * num;
  result1(2, 2) = 8.4;

  matrix1.MulNumber(num);

  ASSERT_FALSE(matrix1.EqMatrix(result1));
}

TEST(OperatorMulNum, Subtest_1) {
  S21Matrix matrix1(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //---------------------
  double num = 1.1;
  result1(0, 0) = 4.3 * num;
  result1(0, 1) = -1.0 * num;
  result1(0, 2) = 5.7 * num;

  result1(1, 0) = 4.8 * num;
  result1(1, 1) = -2.0 * num;
  result1(1, 2) = 1.6 * num;

  result1(2, 0) = 9.4 * num;
  result1(2, 1) = 3.5 * num;
  result1(2, 2) = 8.4 * num;

  S21Matrix result2 = matrix1 * num;

  ASSERT_TRUE(result2.EqMatrix(result1));
}

TEST(OperatorMulNum, Subtest_2) {
  S21Matrix matrix1(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //---------------------
  double num = 1.1;
  result1(0, 0) = 4.3 * num;
  result1(0, 1) = -1.0 * num;
  result1(0, 2) = 5.7 * num;

  result1(1, 0) = 4.8 * num;
  result1(1, 1) = -2.0 * num;
  result1(1, 2) = 1.6 * num;

  result1(2, 0) = 9.4 * num;
  result1(2, 1) = 3.5 * num;
  result1(2, 2) = 8.4;

  S21Matrix result2 = matrix1 * num;

  ASSERT_FALSE(result2.EqMatrix(result1));
}

TEST(OperatorMulNum, Subtest_3) {
  S21Matrix matrix1(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //---------------------
  double num = 1.1;
  result1(0, 0) = 4.3 * num;
  result1(0, 1) = -1.0 * num;
  result1(0, 2) = 5.7 * num;

  result1(1, 0) = 4.8 * num;
  result1(1, 1) = -2.0 * num;
  result1(1, 2) = 1.6 * num;

  result1(2, 0) = 9.4 * num;
  result1(2, 1) = 3.5 * num;
  result1(2, 2) = 8.4 * num;

  matrix1 *= num;

  ASSERT_TRUE(matrix1.EqMatrix(result1));
}

TEST(OperatorMulNum, Subtest_4) {
  S21Matrix matrix1(3, 3);
  S21Matrix result1(3, 3);

  matrix1(0, 0) = 4.3;
  matrix1(0, 1) = -1.0;
  matrix1(0, 2) = 5.7;

  matrix1(1, 0) = 4.8;
  matrix1(1, 1) = -2.0;
  matrix1(1, 2) = 1.6;

  matrix1(2, 0) = 9.4;
  matrix1(2, 1) = 3.5;
  matrix1(2, 2) = 8.4;
  //---------------------
  double num = 1.1;
  result1(0, 0) = 4.3 * num;
  result1(0, 1) = -1.0 * num;
  result1(0, 2) = 5.7 * num;

  result1(1, 0) = 4.8 * num;
  result1(1, 1) = -2.0 * num;
  result1(1, 2) = 1.6 * num;

  result1(2, 0) = 9.4 * num;
  result1(2, 1) = 3.5 * num;
  result1(2, 2) = 8.4;

  matrix1 *= num;

  ASSERT_FALSE(matrix1.EqMatrix(result1));
}

TEST(MulMatrix, Subtest_1) {
  S21Matrix matrix1(3, 2);
  S21Matrix matrix2(2, 2);
  S21Matrix result(3, 2);
  matrix1(0, 0) = 1.0;
  matrix1(0, 1) = 0.0;

  matrix1(1, 0) = 3.0;
  matrix1(1, 1) = -1.0;

  matrix1(2, 0) = -3.0;
  matrix1(2, 1) = -2.0;

  matrix2(0, 0) = 1;
  matrix2(0, 1) = 2;
  matrix2(1, 0) = 3;
  matrix2(1, 1) = 4;

  result(0, 0) = 1.0;
  result(0, 1) = 2.0;

  result(1, 0) = 0.0;
  result(1, 1) = 2.0;

  result(2, 0) = -9.0;
  result(2, 1) = -14.0;

  matrix1.MulMatrix(matrix2);
  ASSERT_TRUE(matrix1.EqMatrix(result));
}

TEST(MulMatrix, Subtest_2) {
  S21Matrix matrix1(3, 2);
  S21Matrix matrix2(2, 2);
  S21Matrix result(3, 2);
  matrix1(0, 0) = 1.0;
  matrix1(0, 1) = 0.0;

  matrix1(1, 0) = 3.0;
  matrix1(1, 1) = -1.0;

  matrix1(2, 0) = -3.0;
  matrix1(2, 1) = -2.0;

  matrix2(0, 0) = 1;
  matrix2(0, 1) = 2;
  matrix2(1, 0) = 3;
  matrix2(1, 1) = 4;

  result(0, 0) = 1.0;
  result(0, 1) = 2.0;

  result(1, 0) = 0.0;
  result(1, 1) = 0.0;

  result(2, 0) = -9.0;
  result(2, 1) = -14.0;
  matrix1.MulMatrix(matrix2);
  ASSERT_FALSE(matrix1.EqMatrix(result));
}

TEST(MulMatrix, Subtest_3) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW(matrix1.MulMatrix(matrix2), std::logic_error);
}

TEST(OperatorMulMatrix, Subtest_1) {
  S21Matrix matrix1(3, 2);
  S21Matrix matrix2(2, 2);
  S21Matrix result(3, 2);
  matrix1(0, 0) = 1.0;
  matrix1(0, 1) = 0.0;

  matrix1(1, 0) = 3.0;
  matrix1(1, 1) = -1.0;

  matrix1(2, 0) = -3.0;
  matrix1(2, 1) = -2.0;

  matrix2(0, 0) = 1;
  matrix2(0, 1) = 2;
  matrix2(1, 0) = 3;
  matrix2(1, 1) = 4;

  result(0, 0) = 1.0;
  result(0, 1) = 2.0;

  result(1, 0) = 0.0;
  result(1, 1) = 2.0;

  result(2, 0) = -9.0;
  result(2, 1) = -14.0;

  S21Matrix result2 = matrix1 * matrix2;
  ASSERT_TRUE(result2.EqMatrix(result));
}

TEST(OperatorMulMatrix, Subtest_2) {
  S21Matrix matrix1(3, 2);
  S21Matrix matrix2(2, 2);
  S21Matrix result(3, 2);
  matrix1(0, 0) = 1.0;
  matrix1(0, 1) = 0.0;

  matrix1(1, 0) = 3.0;
  matrix1(1, 1) = -1.0;

  matrix1(2, 0) = -3.0;
  matrix1(2, 1) = -2.0;

  matrix2(0, 0) = 1;
  matrix2(0, 1) = 2;
  matrix2(1, 0) = 3;
  matrix2(1, 1) = 4;

  result(0, 0) = 1.0;
  result(0, 1) = 2.0;

  result(1, 0) = 0.0;
  result(1, 1) = 2.0;

  result(2, 0) = -9.0;
  result(2, 1) = -1.0;

  S21Matrix result2 = matrix1 * matrix2;
  ASSERT_FALSE(result2.EqMatrix(result));
}

TEST(OperatorMulMatrix, Subtest_3) {
  S21Matrix matrix1(3, 2);
  S21Matrix matrix2(2, 2);
  S21Matrix result(3, 2);
  matrix1(0, 0) = 1.0;
  matrix1(0, 1) = 0.0;

  matrix1(1, 0) = 3.0;
  matrix1(1, 1) = -1.0;

  matrix1(2, 0) = -3.0;
  matrix1(2, 1) = -2.0;

  matrix2(0, 0) = 1;
  matrix2(0, 1) = 2;
  matrix2(1, 0) = 3;
  matrix2(1, 1) = 4;

  result(0, 0) = 1.0;
  result(0, 1) = 2.0;

  result(1, 0) = 0.0;
  result(1, 1) = 2.0;

  result(2, 0) = -9.0;
  result(2, 1) = -14.0;

  matrix1 *= matrix2;
  ASSERT_TRUE(matrix1.EqMatrix(result));
}

TEST(OperatorMulMatrix, Subtest_4) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW((matrix1 * matrix2), std::logic_error);
}

TEST(OperatorMulMatrix, Subtest_5) {
  S21Matrix matrix1(1, 1);
  S21Matrix matrix2(2, 2);
  EXPECT_THROW((matrix1 *= matrix2), std::logic_error);
}

TEST(AccMut, Subtest_1) {
  S21Matrix matrix2(2, 2);
  S21Matrix result(3, 2);

  matrix2(0, 0) = 1.0;
  matrix2(0, 1) = 2.0;
  matrix2(1, 0) = 3.0;
  matrix2(1, 1) = 4.0;

  result(0, 0) = 1.0;
  result(0, 1) = 2.0;

  result(1, 0) = 3.0;
  result(1, 1) = 4.0;

  result(2, 0) = 0.0;
  result(2, 1) = 0.0;

  matrix2.SetRows(3);
  ASSERT_TRUE(matrix2.EqMatrix(result));
}

TEST(AccMut, Subtest_2) {
  S21Matrix matrix2(2, 2);
  S21Matrix result(1, 2);

  matrix2(0, 0) = 1.0;
  matrix2(0, 1) = 2.0;
  matrix2(1, 0) = 3.0;
  matrix2(1, 1) = 4.0;

  result(0, 0) = 1.0;
  result(0, 1) = 2.0;

  matrix2.SetRows(1);

  ASSERT_TRUE(matrix2.EqMatrix(result));
}

TEST(AccMut, Subtest_3) {
  S21Matrix matrix2(2, 2);
  S21Matrix result(2, 3);

  matrix2(0, 0) = 1.0;
  matrix2(0, 1) = 2.0;
  matrix2(1, 0) = 3.0;
  matrix2(1, 1) = 4.0;

  result(0, 0) = 1.0;
  result(0, 1) = 2.0;
  result(0, 2) = 0.0;
  result(1, 0) = 3.0;
  result(1, 1) = 4.0;
  result(1, 2) = 0.0;

  matrix2.SetColums(3);
  ASSERT_TRUE(matrix2.EqMatrix(result));
}

TEST(AccMut, Subtest_4) {
  S21Matrix matrix2(2, 2);
  S21Matrix result(2, 1);

  matrix2(0, 0) = 1.0;
  matrix2(0, 1) = 2.0;
  matrix2(1, 0) = 3.0;
  matrix2(1, 1) = 4.0;

  result(0, 0) = 1.0;
  result(1, 0) = 3.0;

  matrix2.SetColums(1);

  ASSERT_TRUE(matrix2.EqMatrix(result));
}

TEST(AccMut, Subtest_5) {
  S21Matrix matrix(3, 3);
  EXPECT_THROW(matrix.SetRows(0), std::out_of_range);
}

TEST(AccMut, Subtest_6) {
  S21Matrix matrix(3, 3);
  EXPECT_THROW(matrix.SetColums(0), std::out_of_range);
}

TEST(Transpose, Subtest_1) {
  S21Matrix matrix(2, 3);
  S21Matrix matrixt(3, 2);
  matrix(0, 0) = 1.0;
  matrix(0, 1) = 2.0;
  matrix(0, 2) = 3.0;

  matrix(1, 0) = 4.0;
  matrix(1, 1) = 5.0;
  matrix(1, 2) = 6.0;

  matrixt(0, 0) = 1.0;
  matrixt(0, 1) = 4.0;

  matrixt(1, 0) = 2.0;
  matrixt(1, 1) = 5.0;

  matrixt(2, 0) = 3.0;
  matrixt(2, 1) = 6.0;

  S21Matrix result = matrix.Transpose();

  ASSERT_TRUE(result.EqMatrix(matrixt));
}

TEST(Transpose, Subtest_2) {
  S21Matrix matrix(1, 1);
  matrix(0, 0) = 1.0;
  S21Matrix result = matrix.Transpose();
  ASSERT_TRUE(result.EqMatrix(matrix));
}

TEST(Determinant, Subtest_1) {
  S21Matrix matrix(4, 4);
  matrix(0, 0) = 1;
  matrix(0, 1) = 2;
  matrix(0, 2) = 9;
  matrix(0, 3) = 6;

  matrix(1, 0) = 3;
  matrix(1, 1) = 7;
  matrix(1, 2) = -1;
  matrix(1, 3) = 0;

  matrix(2, 0) = 5;
  matrix(2, 1) = 3;
  matrix(2, 2) = 1;
  matrix(2, 3) = 2;

  matrix(3, 0) = 7;
  matrix(3, 1) = 1;
  matrix(3, 2) = 12;
  matrix(3, 3) = -4;
  double det = matrix.Determinant();
  double result = 3290;

  ASSERT_DOUBLE_EQ(det, result);
}

TEST(Determinant, Subtest_2) {
  S21Matrix matrix(2, 2);
  matrix(0, 0) = 1;
  matrix(0, 1) = 2;

  matrix(1, 0) = 3;
  matrix(1, 1) = 7;
  double det = matrix.Determinant();
  double result = 1;

  ASSERT_DOUBLE_EQ(det, result);
}

TEST(Determinant, Subtest_3) {
  S21Matrix matrix(1, 2);
  EXPECT_THROW(matrix.Determinant(), std::logic_error);
}

TEST(CalcComplements, Subtest_1) {
  S21Matrix matrix(3, 3);
  S21Matrix matrixcalc(3, 3);
  matrix(0, 0) = 1.0;
  matrix(0, 1) = 2.0;
  matrix(0, 2) = 3.0;

  matrix(1, 0) = 0.0;
  matrix(1, 1) = 4.0;
  matrix(1, 2) = 2.0;

  matrix(2, 0) = 5.0;
  matrix(2, 1) = 2.0;
  matrix(2, 2) = 1.0;

  matrixcalc(0, 0) = 0.0;
  matrixcalc(0, 1) = 10.0;
  matrixcalc(0, 2) = -20.0;

  matrixcalc(1, 0) = 4.0;
  matrixcalc(1, 1) = -14.0;
  matrixcalc(1, 2) = 8.0;

  matrixcalc(2, 0) = -8.0;
  matrixcalc(2, 1) = -2.0;
  matrixcalc(2, 2) = 4.0;
  S21Matrix result = matrix.CalcComplements();
  ASSERT_TRUE(result.EqMatrix(matrixcalc));
}

TEST(CalcComplements, Subtest_2) {
  S21Matrix matrix(3, 3);
  S21Matrix matrixcalc(3, 3);
  matrix(0, 0) = 1.0;
  matrix(0, 1) = 2.0;
  matrix(0, 2) = 3.0;

  matrix(1, 0) = 0.0;
  matrix(1, 1) = 4.0;
  matrix(1, 2) = 2.0;

  matrix(2, 0) = 5.0;
  matrix(2, 1) = 2.0;
  matrix(2, 2) = 1.0;

  matrixcalc(0, 0) = 0.0;
  matrixcalc(0, 1) = 0.0;
  matrixcalc(0, 2) = -20.0;

  matrixcalc(1, 0) = 4.0;
  matrixcalc(1, 1) = -14.0;
  matrixcalc(1, 2) = 8.0;

  matrixcalc(2, 0) = -8.0;
  matrixcalc(2, 1) = -2.0;
  matrixcalc(2, 2) = 4.0;
  S21Matrix result = matrix.CalcComplements();
  ASSERT_FALSE(result.EqMatrix(matrixcalc));
}

TEST(CalcComplements, Subtest_3) {
  S21Matrix matrix(1, 2);
  EXPECT_THROW(matrix.CalcComplements(), std::logic_error);
}

TEST(CalcComplements, Subtest_4) {
  S21Matrix matrix(1, 1);
  matrix(0, 0) = 5;
  S21Matrix matrixcalc(1, 1);
  matrixcalc(0, 0) = 1;
  S21Matrix result = matrix.CalcComplements();
  ASSERT_TRUE(result.EqMatrix(matrixcalc));
}

TEST(InverseMatrix, Subtest_1) {
  S21Matrix matrix(3, 3);
  S21Matrix matrixinv(3, 3);
  matrix(0, 0) = 2.0;
  matrix(0, 1) = 5.0;
  matrix(0, 2) = 7.0;

  matrix(1, 0) = 6.0;
  matrix(1, 1) = 3.0;
  matrix(1, 2) = 4.0;

  matrix(2, 0) = 5.0;
  matrix(2, 1) = -2.0;
  matrix(2, 2) = -3.0;

  matrixinv(0, 0) = 1.0;
  matrixinv(0, 1) = -1.0;
  matrixinv(0, 2) = 1.0;

  matrixinv(1, 0) = -38.0;
  matrixinv(1, 1) = 41.0;
  matrixinv(1, 2) = -34.0;

  matrixinv(2, 0) = 27.0;
  matrixinv(2, 1) = -29.0;
  matrixinv(2, 2) = 24.0;
  S21Matrix result = matrix.InverseMatrix();
  ASSERT_TRUE(result.EqMatrix(matrixinv));
}

TEST(InverseMatrix, Subtest_2) {
  S21Matrix matrix;
  matrix(0, 0) = 5;
  S21Matrix result = matrix.InverseMatrix();
  double value1 = result(0, 0);
  double value2 = pow(matrix(0, 0), -1);
  ASSERT_DOUBLE_EQ(value1, value2);
}

TEST(InverseMatrix, Subtest_3) {
  S21Matrix matrix;
  matrix(0, 0) = 0;
  EXPECT_THROW(matrix.InverseMatrix(), std::logic_error);
}

TEST(OperatorM, Subtest_1) {
  S21Matrix matrix(3, 3);
  EXPECT_THROW(matrix(-1, 2), std::out_of_range);
}

TEST(OperatorM, Subtest_2) {
  const S21Matrix matrix(3, 3);
  EXPECT_THROW(matrix(4, 2), std::out_of_range);
}

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}