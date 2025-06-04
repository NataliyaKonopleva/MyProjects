#include "../s21_tests.h"

START_TEST(equal_same_power_same_minus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 3;
  val1.bits[2] = 1;
  val1.power = 0;
  val1.sign = 1;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 3;
  val2.bits[2] = 1;
  val2.power = 0;
  val2.sign = 1;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(equal_positive_and_negative_zero) {
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

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(equal_different_power_same_minus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;

  s21_decimal val2 = {0};
  val2.bits[0] = 50;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 1;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(equal_different_power_same_plus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 500;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 2;
  val1.sign = 0;

  s21_decimal val2 = {0};
  val2.bits[0] = 50;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 0;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(first_lower_same_power_same_minus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 3;
  val1.bits[2] = 2;
  val1.power = 0;
  val1.sign = 1;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 3;
  val2.bits[2] = 1;
  val2.power = 0;
  val2.sign = 1;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 0);
}
END_TEST

START_TEST(first_greater_same_power_same_minus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 3;
  val1.bits[2] = 1;
  val1.power = 0;
  val1.sign = 1;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 3;
  val2.bits[2] = 1;
  val2.power = 0;
  val2.sign = 1;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(first_greater_same_power_same_plus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 6;
  val1.bits[1] = 3;
  val1.bits[2] = 1;
  val1.power = 0;
  val1.sign = 0;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 3;
  val2.bits[2] = 1;
  val2.power = 0;
  val2.sign = 0;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(second_greater_same_power_same_plus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 4;
  val1.bits[1] = 3;
  val1.bits[2] = 1;
  val1.power = 0;
  val1.sign = 0;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 3;
  val2.bits[2] = 1;
  val2.power = 0;
  val2.sign = 0;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 0);
}
END_TEST

START_TEST(second_greater_different_power_same_plus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 1;
  val1.sign = 0;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 0);
}
END_TEST

START_TEST(first_greater_different_power_same_plus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 1;
  val1.sign = 0;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 5;
  val2.sign = 0;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(second_greater_different_power_different_plus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 1;
  val1.sign = 1;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 5;
  val2.sign = 0;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 0);
}
END_TEST

START_TEST(first_greater_different_power_different_plus_sign) {
  s21_decimal val1 = {0};
  val1.bits[0] = 5;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 1;
  val1.sign = 0;

  s21_decimal val2 = {0};
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 5;
  val2.sign = 1;

  unsigned int CODEERROR = 0;

  CODEERROR = s21_is_greater_or_equal(val1, val2);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

Suite *suite_is_greater_or_equal(void) {
  Suite *s = suite_create("suite_is_greater_or_equal");
  TCase *tc = tcase_create("tc_is_greater_or_equal");

  tcase_add_test(tc, equal_same_power_same_minus_sign);
  tcase_add_test(tc, first_lower_same_power_same_minus_sign);
  tcase_add_test(tc, first_greater_same_power_same_minus_sign);
  tcase_add_test(tc, first_greater_same_power_same_plus_sign);
  tcase_add_test(tc, first_greater_same_power_same_plus_sign);
  tcase_add_test(tc, second_greater_different_power_same_plus_sign);
  tcase_add_test(tc, second_greater_same_power_same_plus_sign);
  tcase_add_test(tc, first_greater_different_power_same_plus_sign);
  tcase_add_test(tc, second_greater_different_power_different_plus_sign);
  tcase_add_test(tc, first_greater_different_power_different_plus_sign);
  tcase_add_test(tc, equal_different_power_same_minus_sign);
  tcase_add_test(tc, equal_different_power_same_plus_sign);
  tcase_add_test(tc, equal_positive_and_negative_zero);

  suite_add_tcase(s, tc);
  return s;
}