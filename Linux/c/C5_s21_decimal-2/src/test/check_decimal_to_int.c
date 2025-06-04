#include <limits.h>

#include "../s21_tests.h"

#define S21_TRUE 1
#define S21_FALSE 0
#define CONVERTERS_S21_TRUE 0
#define CONVERTERS_S21_FALSE 1
#define S21_MAX_UINT 4294967295       // 0b11111111111111111111111111111111
#define MAX_INT 2147483647            // 0b01111111111111111111111111111111
#define EXPONENT_MINUS_1 2147549184   // 0b10000000000000010000000000000000
#define EXPONENT_PLUS_1 65536         // 0b00000000000000010000000000000000
#define EXPONENT_PLUS_2 196608        // 0b00000000000000110000000000000000
#define EXPONENT_MINUS_28 2149318656  // 0b10000000000111000000000000000000
#define EXPONENT_PLUS_28 1835008      // 0b00000000000111000000000000000000
#define MINUS 2147483648              // 0b10000000000000000000000000000000
#define MAX_DECIMAL 79228162514264337593543950335.0F
#define MIN_DECIMAL -79228162514264337593543950335.0F

START_TEST(test1) {
  s21_decimal temp = {{1234, 0, 0, 0}};
  temp.power = 1;
  int result;
  int exp_result = 123;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(test2) {
  s21_decimal temp = {{1234, 0, 0, 0}};
  temp.power = 3;
  temp.sign = 1;
  int result;
  int exp_result = -1;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(test3) {
  s21_decimal temp = {{2147483647, 0, 0, 0}};
  int result;
  int exp_result = 2147483647;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(test4) {
  s21_decimal temp = {{9, 0, 0, 0}};
  temp.power = 1;
  temp.sign = 1;
  int result;
  int exp_result = 0;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(test5) {
  s21_decimal temp = {{0b10011010010, 0, 0, 0}};
  temp.power = 1;
  int result;
  int exp_result = 123;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(test6) {
  s21_decimal temp = {{0b10011010010, 0, 0, 0}};
  temp.power = 3;
  temp.sign = 1;
  int result;
  int exp_result = -1;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(test7) {
  s21_decimal temp = {{0b1111111111111111111111111111111, 0, 0, 0}};
  int result;
  int exp_result = 2147483647;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(test8) {
  s21_decimal temp = {{0b10011010010, 0, 0, 0}};
  temp.power = 4;
  temp.sign = 1;
  int result;
  int exp_result = 0;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(test9) {
  s21_decimal temp = {{0b00111000110001100100101011000100,
                       0b00000000000000000000000000000001, 0, 0}};
  temp.power = 1;
  temp.sign = 0;
  int result = 0;
  int exp_result = 524748666;
  int res = s21_from_decimal_to_int(temp, &result);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  ck_assert_int_eq(result, exp_result);
}
END_TEST

START_TEST(dec_to_int) {
  s21_decimal a = {{123, 0, 0, 0}};
  a.power = 1;
  int int_a;
  s21_from_decimal_to_int(a, &int_a);
  ck_assert_int_eq(int_a, 12);
  s21_from_decimal_to_int(a, &int_a);
  ck_assert_int_eq(int_a, 12);
}
END_TEST

START_TEST(test_0) {
  s21_decimal decimal = {{0, 0, 0, 0}};
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(0, value);
}
END_TEST

START_TEST(test_1) {
  s21_decimal decimal = {0};
  decimal.bits[0] = 1;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(1, value);
}
END_TEST

START_TEST(test_2) {
  s21_decimal decimal = {0};
  decimal.bits[0] = INT_MAX;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(INT_MAX, value);
}
END_TEST

START_TEST(test_3) {
  s21_decimal decimal = {0};
  decimal.bits[0] = 1;
  decimal.sign = 1;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(-1, value);
}
END_TEST

START_TEST(test_4) {
  s21_decimal decimal = {0};
  decimal.bits[0] = 0X80000000;
  decimal.sign = 1;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(INT_MIN, value);
}
END_TEST

START_TEST(test_6) {
  s21_decimal decimal = {0};
  decimal.bits[1] = 1;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(1, result);
  ck_assert_int_eq(0, value);
}
END_TEST

START_TEST(test_7) {
  s21_decimal decimal = {0};
  decimal.sign = 1;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(0, value);
}
END_TEST

START_TEST(test_8) {
  s21_decimal decimal = {0};
  decimal.bits[0] = 12345;
  decimal.sign = 1;
  decimal.power = 1;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(-1234, value);
}
END_TEST

START_TEST(test_9) {
  s21_decimal decimal = {0};
  decimal.bits[0] = 12345;
  decimal.sign = 1;
  decimal.power = 7;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(0, value);
}
END_TEST

START_TEST(test_10) {
  s21_decimal decimal = {0};
  decimal.bits[0] = 199999999;
  decimal.sign = 1;
  decimal.power = 3;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(-199999, value);
}
END_TEST

START_TEST(test_11) {
  s21_decimal decimal = {0};
  decimal.bits[0] = 0b00000000000000000000000000001111;
  decimal.power = 1;
  int value = 0;

  int result = s21_from_decimal_to_int(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(1, value);
}
END_TEST

START_TEST(s21_from_decimal_to_int_1) {
  s21_decimal src;
  int result = 0, number = 0;
  src.bits[0] = INT_MAX;
  src.bits[1] = 0;
  src.bits[2] = 0;
  src.bits[3] = 0;
  result = s21_from_decimal_to_int(src, &number);
  ck_assert_float_eq(number, 2147483647);
  ck_assert_int_eq(result, 0);
}
END_TEST

START_TEST(s21_from_decimal_to_int_2) {
  s21_decimal src;
  int result = 0, number = 0;
  src.bits[0] = 133141;
  src.bits[1] = 0;
  src.bits[2] = 0;
  src.bits[3] = 0;
  result = s21_from_decimal_to_int(src, &number);
  ck_assert_int_eq(number, 133141);
  ck_assert_int_eq(result, 0);
}
END_TEST

START_TEST(s21_from_decimal_to_int_4) {
  s21_decimal src;
  int result = 0, number = 0;
  long int c = 2147483648;
  src.bits[0] = 123451234;
  src.bits[1] = 0;
  src.bits[2] = 0;
  src.bits[3] = c;
  result = s21_from_decimal_to_int(src, &number);
  ck_assert_int_eq(number, -123451234);
  ck_assert_int_eq(result, 0);
}
END_TEST

START_TEST(s21_from_decimal_to_int_5) {
  s21_decimal src;
  int result = 0, number = 0;
  long int c = 2147483648;
  src.bits[0] = 18;
  src.bits[1] = 0;
  src.bits[2] = 0;
  src.bits[3] = c;  // 2147483648
  result = s21_from_decimal_to_int(src, &number);
  ck_assert_int_eq(number, -18);
  ck_assert_int_eq(result, 0);
}
END_TEST

START_TEST(s21_from_decimal_to_int_6) {
  s21_decimal src;
  int result = 0, number = 0;
  long int c = 4294967295;
  src.bits[0] = c;
  src.bits[1] = c;
  src.bits[2] = 0;
  src.bits[3] = 0;
  result = s21_from_decimal_to_int(src, &number);
  ck_assert_int_eq(number, 0);
  ck_assert_int_eq(result, 1);
  //   ck_assert_int_eq(number, 0xFFFFFFFFFFFFFFFF);
  //   ck_assert_int_eq(result, 0);
}
END_TEST

int check, result, code;

START_TEST(s21_test_from_decimal_to_int_0) {
  s21_decimal a = {{100, 0, 0, 0}};
  check = 100;
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_1) {
  s21_decimal a = {{INT_MAX, 0, 0, 0}};
  check = INT_MAX;
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_3) {
  s21_decimal a = {{INT_MAX, INT_MAX, INT_MAX, 0}};
  check = 0;
  code = s21_from_decimal_to_int(a, &result);
  //   ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 1);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_4) {
  s21_decimal a = {{INT_MAX, INT_MAX, INT_MAX, INT_MAX}};
  check = 0;
  code = s21_from_decimal_to_int(a, &result);
  //   ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 1);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_6) {
  s21_decimal a = {{S21_MAX_UINT, S21_MAX_UINT, 0, 0}};
  check = 0;
  code = s21_from_decimal_to_int(a, &result);
  //   ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 1);
}
END_TEST
START_TEST(s21_test_from_decimal_to_int_7) {
  s21_decimal a = {{S21_MAX_UINT, S21_MAX_UINT, S21_MAX_UINT, 0}};
  check = 0;
  code = s21_from_decimal_to_int(a, &result);
  //   ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 1);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_8) {
  s21_decimal a = {{S21_MAX_UINT, S21_MAX_UINT, S21_MAX_UINT, S21_MAX_UINT}};
  check = 0;
  code = s21_from_decimal_to_int(a, &result);
  //   ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 1);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_9) {
  s21_decimal a = {{INT_MAX, 0, 0, MINUS}};
  // int error = 0;
  check = -INT_MAX;
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_11) {
  s21_decimal a = {{INT_MAX, 0, 0, EXPONENT_PLUS_1}};
  check = 214748364;  // (int)(INT_MAX / 10^1)
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_12) {
  s21_decimal a = {{INT_MAX, 0, 0, EXPONENT_MINUS_28}};
  check = 0;  // (int)(INT_MAX / 10^28)
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_14) {
  s21_decimal a = {{INT_MAX, 0, 0, EXPONENT_PLUS_28}};
  check = 0;  // (int)(INT_MAX / 10^28)
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_15) {
  s21_decimal a;
  a.bits[0] = 0b10000000000000000000000000000000;
  a.bits[1] = 0b00000000000000000000000000000000;
  a.bits[2] = 0b00000000000000000000000000000000;
  a.bits[3] = 0b10000000000000000000000000000000;
  check = -2147483648;
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_16) {
  s21_decimal a;
  a.bits[0] = 0b00000000000000000000000000000001;
  a.bits[1] = 0b00000000000000000000000000000000;
  a.bits[2] = 0b00000000000000000000000000000000;
  a.bits[3] = 0b00000000000000000000000000000000;
  check = 1;
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_test_from_decimal_to_int_17) {
  s21_decimal a;
  a.bits[0] = 0b10000000000000000000000000000001;
  a.bits[1] = 0b00000000000000000000000000000000;
  a.bits[2] = 0b00000000000000000000000000000000;
  a.bits[3] = 0b00000000000000000000000000000000;
  check = -2147483647;
  code = s21_from_decimal_to_int(a, &result);
  ck_assert_int_eq(result, check);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest1) {
  // 6556
  s21_decimal src1;
  // src1 = 2;

  src1.bits[0] = 0b00000000000000000000000000000010;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b00000000000000000000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, 2);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest2) {
  // 6570
  s21_decimal src1;
  // src1 = 0;

  src1.bits[0] = 0b00000000000000000000000000000000;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b00000000000000000000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, 0);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest3) {
  // 6584
  s21_decimal src1;
  // src1 = 3.5;

  src1.bits[0] = 0b00000000000000000000000000100011;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b00000000000000010000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, 3);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest4) {
  // 6598
  s21_decimal src1;
  // src1 = 4.5;

  src1.bits[0] = 0b00000000000000000000000000101101;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b00000000000000010000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, 4);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest5) {
  // 6612
  s21_decimal src1;
  // src1 = -4.5;

  src1.bits[0] = 0b00000000000000000000000000101101;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b10000000000000010000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, -4);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest6) {
  // 6626
  s21_decimal src1;
  int code = 0;
  // src1 = -5454.3526545;

  src1.bits[0] = 0b10110011000011000010101010010001;
  src1.bits[1] = 0b00000000000000000000000000001100;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b10000000000001110000000000000000;
  int result;
  //   print_2(&src1);
  //   int *res = &result;
  code = s21_from_decimal_to_int(src1, &result);
  ck_assert_int_eq(result, -5454);
  ck_assert_int_eq(code, 0);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest7) {
  // 6640
  s21_decimal src1;
  // src1 = -5.492654545456454545645464;

  src1.bits[0] = 0b00000111100110110001111110011000;
  src1.bits[1] = 0b01100110010010001001000110100011;
  src1.bits[2] = 0b00000000000001001000101100011101;
  src1.bits[3] = 0b10000000000110000000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, -5);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest8) {
  // 6654
  s21_decimal src1;
  // src1 = 796132784.879754;

  src1.bits[0] = 0b00011011110101100011100010001010;
  src1.bits[1] = 0b00000000000000101101010000010100;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b00000000000001100000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, 796132784);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest9) {
  // 6668
  s21_decimal src1;
  // src1 = -12345677.187654345678987654346;

  src1.bits[0] = 0b01111000100010101111010011001010;
  src1.bits[1] = 0b01100010000010101110010010000111;
  src1.bits[2] = 0b00100111111001000001101011010101;
  src1.bits[3] = 0b10000000000101010000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, -12345677);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest10) {
  // 6682
  s21_decimal src1;
  // src1 = 2.5086531268974139743;

  src1.bits[0] = 0b01100101111011101101100101011111;
  src1.bits[1] = 0b01011100001001010100001101000110;
  src1.bits[2] = 0b00000000000000000000000000000001;
  src1.bits[3] = 0b00000000000100110000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, 2);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest11) {
  // 6696
  s21_decimal src1;
  // src1 = 1;

  src1.bits[0] = 0b00000000000000000000000000000001;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b00000000000000000000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, 1);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest12) {
  // 6710
  s21_decimal src1;
  // src1 = 1.25;

  src1.bits[0] = 0b00000000000000000000000001111101;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b00000000000000100000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, 1);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest13) {
  // 6724
  s21_decimal src1;
  // src1 = -1.25;

  src1.bits[0] = 0b00000000000000000000000001111101;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b10000000000000100000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, -1);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest14) {
  // 6738
  s21_decimal src1;
  // src1 = -12.25;

  src1.bits[0] = 0b00000000000000000000010011001001;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b10000000000000100000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, -12);
}
END_TEST

START_TEST(s21_from_decimal_to_intTest15) {
  // 6752
  s21_decimal src1;
  // src1 = -3.5;

  src1.bits[0] = 0b00000000000000000000000000100011;
  src1.bits[1] = 0b00000000000000000000000000000000;
  src1.bits[2] = 0b00000000000000000000000000000000;
  src1.bits[3] = 0b10000000000000010000000000000000;
  int result;
  int *res = &result;
  s21_from_decimal_to_int(src1, res);
  ck_assert_int_eq(result, -3);
}
END_TEST

Suite *suite_decimal_to_int(void) {
  Suite *s = suite_create("suite_decimal_to_int");
  TCase *tc = tcase_create("tc_decimal_to_int");

  tcase_add_test(tc, test1);
  tcase_add_test(tc, test2);
  tcase_add_test(tc, test3);
  tcase_add_test(tc, test4);
  tcase_add_test(tc, test5);
  tcase_add_test(tc, test6);
  tcase_add_test(tc, test7);
  tcase_add_test(tc, test8);
  tcase_add_test(tc, test9);
  tcase_add_test(tc, dec_to_int);
  tcase_add_test(tc, test_0);
  tcase_add_test(tc, test_1);
  tcase_add_test(tc, test_2);
  tcase_add_test(tc, test_3);
  tcase_add_test(tc, test_4);
  tcase_add_test(tc, test_6);
  tcase_add_test(tc, test_7);
  tcase_add_test(tc, test_8);
  tcase_add_test(tc, test_9);
  tcase_add_test(tc, test_10);
  tcase_add_test(tc, test_11);
  tcase_add_test(tc, s21_from_decimal_to_int_1);
  tcase_add_test(tc, s21_from_decimal_to_int_2);
  tcase_add_test(tc, s21_from_decimal_to_int_4);
  tcase_add_test(tc, s21_from_decimal_to_int_5);
  tcase_add_test(tc, s21_from_decimal_to_int_6);

  tcase_add_test(tc, s21_test_from_decimal_to_int_0);
  tcase_add_test(tc, s21_test_from_decimal_to_int_1);

  tcase_add_test(tc, s21_test_from_decimal_to_int_3);
  tcase_add_test(tc, s21_test_from_decimal_to_int_4);

  tcase_add_test(tc, s21_test_from_decimal_to_int_6);

  tcase_add_test(tc, s21_test_from_decimal_to_int_7);
  tcase_add_test(tc, s21_test_from_decimal_to_int_8);
  tcase_add_test(tc, s21_test_from_decimal_to_int_9);

  tcase_add_test(tc, s21_test_from_decimal_to_int_11);
  tcase_add_test(tc, s21_test_from_decimal_to_int_12);
  tcase_add_test(tc, s21_test_from_decimal_to_int_14);

  tcase_add_test(tc, s21_test_from_decimal_to_int_16);
  tcase_add_test(tc, s21_test_from_decimal_to_int_17);
  tcase_add_test(tc, s21_from_decimal_to_intTest1);
  tcase_add_test(tc, s21_from_decimal_to_intTest2);
  tcase_add_test(tc, s21_from_decimal_to_intTest3);
  tcase_add_test(tc, s21_from_decimal_to_intTest4);
  tcase_add_test(tc, s21_from_decimal_to_intTest5);
  tcase_add_test(tc, s21_from_decimal_to_intTest6);
  tcase_add_test(tc, s21_from_decimal_to_intTest7);
  tcase_add_test(tc, s21_from_decimal_to_intTest8);
  tcase_add_test(tc, s21_from_decimal_to_intTest9);
  tcase_add_test(tc, s21_from_decimal_to_intTest10);
  tcase_add_test(tc, s21_from_decimal_to_intTest11);
  tcase_add_test(tc, s21_from_decimal_to_intTest12);
  tcase_add_test(tc, s21_from_decimal_to_intTest13);
  tcase_add_test(tc, s21_from_decimal_to_intTest14);
  tcase_add_test(tc, s21_from_decimal_to_intTest15);
  tcase_add_test(tc, s21_test_from_decimal_to_int_15);

  suite_add_tcase(s, tc);
  return s;
}