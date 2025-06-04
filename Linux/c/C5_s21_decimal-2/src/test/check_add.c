#include "../s21_tests.h"

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

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, NULL);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(positive_overload) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0b11111111111111111111111111111111;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
}
END_TEST

START_TEST(negative_zero_plus_positive_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 0;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(negative_zero_plus_negative_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 0;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(positive_zero_plus_negative_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(positive_zero_plus_positive_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
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
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(negative_overload) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 0b11111111111111111111111111111111;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 2);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
}
END_TEST

START_TEST(bouth_positive) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0b11111111111111111111111111111110;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(bouth_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 0b11111111111111111111111111111110;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(negative_plus_positive) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal val2 = {0};
  val2.bits[0] = 0b11111111111111111111111111111111;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111110);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(positive_plus_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0b11111111111111111111111111111111;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111110);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(null_ptr_as_result) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0b11111111111111111111111111111111;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 1;

  unsigned int CODEERROR = 0;
  CODEERROR = s21_add(val1, val2, NULL);
  ck_assert_int_eq(CODEERROR, 1);
  // NO CRASH IS GOOD RESULT
}
END_TEST

Suite *suite_add(void) {
  Suite *s = suite_create("suite_add");
  TCase *tc = tcase_create("tc_add");

  tcase_add_test(tc, positive_overload);
  tcase_add_test(tc, negative_overload);
  tcase_add_test(tc, bouth_positive);
  tcase_add_test(tc, bouth_negative);
  tcase_add_test(tc, negative_plus_positive);
  tcase_add_test(tc, positive_plus_negative);
  tcase_add_test(tc, null_ptr_as_result);
  tcase_add_test(tc, negative_zero_plus_positive_zero);
  tcase_add_test(tc, negative_zero_plus_negative_zero);
  tcase_add_test(tc, calculation_error);
  tcase_add_test(tc, positive_zero_plus_negative_zero);
  tcase_add_test(tc, positive_zero_plus_positive_zero);

  suite_add_tcase(s, tc);
  return s;
}