#include "../s21_tests.h"

START_TEST(test_0) {
  s21_decimal decimal;
  float value = 0.;

  decimal.bits[0] = 1812;
  decimal.bits[1] = 0;
  decimal.bits[2] = 0;
  decimal.bits[3] = -2147287040;

  int result = s21_from_decimal_to_float(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_float_eq(-1.812, value);
}
END_TEST

START_TEST(test_1) {
  s21_decimal decimal;
  float value = 0.;

  decimal.bits[0] = 5555;
  decimal.bits[1] = 0;
  decimal.bits[2] = 0;
  decimal.bits[3] = -2147287040;

  int result = s21_from_decimal_to_float(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_float_eq(-5.555, value);
}
END_TEST

START_TEST(test_2) {
  s21_decimal decimal;
  float value = 0.;

  decimal.bits[0] = -1171510507;
  decimal.bits[1] = 0;
  decimal.bits[2] = 0;
  decimal.bits[3] = 589824;

  int result = s21_from_decimal_to_float(decimal, &value);

  char ans[64] = {0};
  sprintf(ans, "%f", value);
  ck_assert_int_eq(0, result);
  ck_assert_str_eq("3.123457", ans);
}
END_TEST

START_TEST(test_3) {
  s21_decimal decimal;
  float value = 0.;

  decimal.bits[0] = 1;
  decimal.bits[1] = 0;
  decimal.bits[2] = 0;
  decimal.bits[3] = 0;
  decimal.power = 28;
  decimal.sign = 0;

  int result = s21_from_decimal_to_float(decimal, &value);
  ck_assert_int_eq(0, result);
  ck_assert_float_eq(1e-28, value);
}
END_TEST

START_TEST(test_4) {
  s21_decimal decimal;
  float value = 0.;

  decimal.bits[0] = 123456789;
  decimal.bits[1] = 0;
  decimal.bits[2] = 0;
  decimal.bits[3] = 589824;

  int result = s21_from_decimal_to_float(decimal, &value);

  char ans[64] = {0};
  sprintf(ans, "%.7G", value);
  ck_assert_int_eq(0, result);
  ck_assert_str_eq("0.1234568", ans);
}
END_TEST

START_TEST(test_5) {
  s21_decimal decimal;
  float value = 0.;

  decimal.bits[0] = 0;
  decimal.bits[1] = 0;
  decimal.bits[2] = 0;
  decimal.bits[3] = -2147483648;

  int result = s21_from_decimal_to_float(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_float_eq(-0, value);
}
END_TEST

START_TEST(test_6) {
  s21_decimal decimal;
  float value = 0.;

  decimal.bits[0] = 0;
  decimal.bits[1] = 0;
  decimal.bits[2] = 0;
  decimal.bits[3] = 0;

  int result = s21_from_decimal_to_float(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_float_eq(0, value);
}
END_TEST

START_TEST(test_7) {
  s21_decimal decimal;
  float value = 0.;

  decimal.bits[0] = 1812;
  decimal.bits[1] = 0;
  decimal.bits[2] = 0;
  decimal.bits[3] = -2147287040;

  int result = s21_from_decimal_to_float(decimal, &value);

  ck_assert_int_eq(0, result);
  ck_assert_float_eq(-1.812, value);
}
END_TEST

Suite *s21_from_decimal_to_float_get_tests(void) {
  Suite *s = suite_create("suite_is_d_from_f");
  TCase *tc = tcase_create("test_d_from_f");

  tcase_add_test(tc, test_0);
  tcase_add_test(tc, test_1);
  tcase_add_test(tc, test_2);
  tcase_add_test(tc, test_3);
  tcase_add_test(tc, test_4);
  tcase_add_test(tc, test_5);
  tcase_add_test(tc, test_6);
  tcase_add_test(tc, test_7);

  suite_add_tcase(s, tc);

  return s;
}