#include "../s21_tests.h"

START_TEST(negate_positive) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14567;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 14567;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 4;
  value_expected.sign = 1;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_negative_one) {
  s21_decimal val1 = {0};
  val1.bits[0] = 10000;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 1;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 10000;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 4;
  value_expected.sign = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 10;
  val1.sign = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 0;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 10;
  value_expected.sign = 1;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_positive_downside) {
  s21_decimal val1 = {0};
  val1.bits[0] = 53213;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 53213;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 4;
  value_expected.sign = 1;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14563;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 1;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 14563;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 4;
  value_expected.sign = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_negative_downside) {
  s21_decimal val1 = {0};
  val1.bits[0] = 4567;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 1;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 4567;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 4;
  value_expected.sign = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_positive_zeroresult) {
  s21_decimal val1 = {0};
  val1.bits[0] = 4567;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 4567;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 4;
  value_expected.sign = 1;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_broken_decimal_empty_fields_is_not_empty) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14563;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 1;
  val1.empty1 = 1;
  val1.empty2 = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 0;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 0;
  value_expected.empty1 = 0;
  value_expected.empty2 = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_broken_decimal_empty_fields_is_not_empty_n2) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14563;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 1;
  val1.empty1 = 0;
  val1.empty2 = 1;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 0;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 0;
  value_expected.empty1 = 0;
  value_expected.empty2 = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_broken_decimal_too_big_power) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14563;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 29;
  val1.sign = 0;
  val1.empty1 = 0;
  val1.empty2 = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 0;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 0;
  value_expected.empty1 = 0;
  value_expected.empty2 = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_minus_zero_broken) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  val1.empty1 = 0;
  val1.empty2 = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 0;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 0;
  value_expected.empty1 = 0;
  value_expected.empty2 = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negate_zero2) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  val1.empty1 = 0;
  val1.empty2 = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 0;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 1;
  value_expected.empty1 = 0;
  value_expected.empty2 = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_negate(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

Suite *suite_negate(void) {
  Suite *s = suite_create("suite_negate");
  TCase *tc = tcase_create("tc_negate");
  tcase_add_test(tc, negate_positive);
  tcase_add_test(tc, negate_negative);
  tcase_add_test(tc, negate_broken_decimal_empty_fields_is_not_empty);
  tcase_add_test(tc, negate_broken_decimal_empty_fields_is_not_empty_n2);
  tcase_add_test(tc, negate_broken_decimal_too_big_power);
  tcase_add_test(tc, negate_positive_downside);
  tcase_add_test(tc, negate_negative_downside);
  tcase_add_test(tc, negate_zero);
  tcase_add_test(tc, negate_positive_zeroresult);
  tcase_add_test(tc, negate_negative_one);
  tcase_add_test(tc, negate_minus_zero_broken);
  tcase_add_test(tc, negate_zero2);

  suite_add_tcase(s, tc);
  return s;
}