#include "../s21_tests.h"

START_TEST(round_positive) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14567;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 1;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(negative_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 1;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 0;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(round_zero) {
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
  value_expected.power = 0;
  value_expected.sign = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(round_positive_downside) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14444;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 0;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 1;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 0;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(round_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14563;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 1;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 1;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 1;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(round_negative_downside) {
  s21_decimal val1 = {0};
  val1.bits[0] = 14443;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 4;
  val1.sign = 1;
  s21_decimal value_expected = {0};
  value_expected.bits[0] = 1;
  value_expected.bits[1] = 0;
  value_expected.bits[2] = 0;
  value_expected.power = 0;
  value_expected.sign = 1;

  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(round_broken_decimal_empty_fields_is_not_empty) {
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
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(round_broken_decimal_empty_fields_is_not_empty_n2) {
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
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

START_TEST(round_broken_decimal_too_big_power) {
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
  CODEERROR = s21_round(val1, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], value_expected.bits[0]);  // максимум -1
  ck_assert_int_eq(result.bits[1], value_expected.bits[1]);
  ck_assert_int_eq(result.bits[2], value_expected.bits[2]);
  ck_assert_int_eq(result.power, value_expected.power);
  ck_assert_int_eq(result.sign, value_expected.sign);
}
END_TEST

Suite *suite_round(void) {
  Suite *s = suite_create("suite_round");
  TCase *tc = tcase_create("tc_round");
  tcase_add_test(tc, round_positive);
  tcase_add_test(tc, round_negative);
  tcase_add_test(tc, round_broken_decimal_empty_fields_is_not_empty);
  tcase_add_test(tc, round_broken_decimal_empty_fields_is_not_empty_n2);
  tcase_add_test(tc, round_broken_decimal_too_big_power);
  tcase_add_test(tc, round_positive_downside);
  tcase_add_test(tc, round_negative_downside);
  tcase_add_test(tc, round_zero);
  tcase_add_test(tc, negative_zero);

  suite_add_tcase(s, tc);
  return s;
}