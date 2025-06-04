#include "../s21_tests.h"
// (максимум-1)/2         0b01111111111111111111111111111111
// 0b11111111111111111111111111111111 0b11111111111111111111111111111111

START_TEST(calculation_error) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 30;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0;  // умножим на -0
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(result.power, 0);
}
END_TEST

START_TEST(negative_zero_div_positive) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 1;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 1);
  ck_assert_int_eq(result.power, 0);
}
END_TEST

START_TEST(negative_zero_div_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 1;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(result.power, 0);
}
END_TEST

START_TEST(zero_div_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 1;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 1);
  ck_assert_int_eq(result.power, 0);
}
END_TEST

START_TEST(positive_overload) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 2;  // разделим на 0,2
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(negative_overload) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2 + 1
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};  // делим на 0,2 тоже самое что умножить на 5
  val2.bits[0] = 2;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 2);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(bouth_positive) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0],
                   0b11111111111111111111111111111110);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(bouth_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2 + 1
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0],
                   0b11111111111111111111111111111110);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(negative_and_positive) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2 + 1
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0],
                   0b11111111111111111111111111111110);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(positive_and_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2 + 1
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0],
                   0b11111111111111111111111111111110);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(positive_and_negative_fractional_result) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 4;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 25);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.power, 2);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(two_positive_fractional_result) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 4;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 125);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.power, 2);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(division_by_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 3);
  ck_assert_int_eq(result.bits[0], 0);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(small_value) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 28;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 100;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 28;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 1);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.power, 2);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(too_small_value) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 28;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 2;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 2);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(odin_v_periode_result) {
  s21_decimal val1 = {0};
  val1.bits[0] = 10;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 9;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_div(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b01100111000111000111000111000111);
  ck_assert_int_eq(result.bits[1], 0b01000101000011001010110101001111);
  ck_assert_int_eq(result.bits[2], 0b00100011111001101110010101001100);
  ck_assert_int_eq(result.power, 28);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

Suite *suite_div(void) {
  Suite *s = suite_create("suite_div");
  TCase *tc = tcase_create("tc_div");

  tcase_add_test(tc, positive_overload);
  tcase_add_test(tc, negative_overload);
  tcase_add_test(tc, bouth_positive);
  tcase_add_test(tc, bouth_negative);
  tcase_add_test(tc, negative_and_positive);
  tcase_add_test(tc, positive_and_negative);
  tcase_add_test(tc, two_positive_fractional_result);
  tcase_add_test(tc, positive_and_negative_fractional_result);
  tcase_add_test(tc, division_by_zero);
  tcase_add_test(tc, small_value);
  tcase_add_test(tc, too_small_value);
  tcase_add_test(tc, odin_v_periode_result);
  tcase_add_test(tc, negative_zero_div_positive);
  tcase_add_test(tc, negative_zero_div_negative);
  tcase_add_test(tc, zero_div_negative);
  tcase_add_test(tc, calculation_error);

  suite_add_tcase(s, tc);
  return s;
}