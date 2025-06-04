#include "../s21_tests.h"

START_TEST(test1) {
  s21_decimal temp;
  float src = 2.3456785;
  int ex_m = 2345679;
  int ex_p = 6;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, ex_m);
  ck_assert_int_eq(temp.power, ex_p);
}
END_TEST

START_TEST(test2) {
  s21_decimal temp;
  float src = -12.3456789;
  int ex_m = -1234568;
  int ex_p = 5;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, ex_m);
  ck_assert_int_eq(temp.power, ex_p);
}
END_TEST

START_TEST(test3) {
  s21_decimal temp;
  float src = 0.0;
  float expect = 0.0;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_float_eq(result, expect);
}
END_TEST

START_TEST(test4) {
  s21_decimal temp;
  float src = -0.2147483648;
  int ex_m = -2147484;
  int ex_p = 7;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, ex_m);
  ck_assert_int_eq(temp.power, ex_p);
}
END_TEST

START_TEST(test5) {
  s21_decimal temp;
  float src = 0.0000008000;
  int ex_m = 8;
  int ex_p = 7;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, ex_m);
  ck_assert_int_eq(temp.power, ex_p);
}
END_TEST

START_TEST(test6) {
  s21_decimal temp;
  float src = 340000.55;
  int ex_m = 3400006;
  int ex_p = 1;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, ex_m);
  ck_assert_int_eq(temp.power, ex_p);
}
END_TEST

START_TEST(test7) {
  s21_decimal temp;
  float src = 3400002.69;
  int ex_m = 3400003;
  int ex_p = 0;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(temp.power, ex_p);
  ck_assert_int_eq(result, ex_m);
}
END_TEST

START_TEST(test8) {
  s21_decimal temp;
  float src = 3400000.15;
  int ex_m = 3400000;
  int ex_p = 0;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(temp.power, ex_p);
  ck_assert_int_eq(result, ex_m);
}
END_TEST

START_TEST(test9) {
  s21_decimal temp;
  float src = 3.4e+38;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 1;
  ck_assert_int_eq(res, exp_res);
}
END_TEST

START_TEST(test10) {
  s21_decimal temp;
  float src = 0.000000008000;
  int ex_m = 8;
  int ex_p = 9;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, ex_m);
  ck_assert_int_eq(temp.power, ex_p);
}
END_TEST

START_TEST(test11) {
  s21_decimal temp;
  float src = 0.000600008000;
  int ex_m = 600008;
  int ex_p = 9;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, ex_m);
  ck_assert_int_eq(temp.power, ex_p);
}
END_TEST

START_TEST(test12) {
  s21_decimal temp;
  float src = 1e-27;
  int ex_m = 1;
  int ex_p = 27;
  int res = s21_from_float_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_float_eq(result, ex_m);
  ck_assert_int_eq(temp.power, ex_p);
}
END_TEST

START_TEST(test_0) {
  float value = 1e-30;
  s21_decimal result = {0};
  s21_decimal expected = {{0, 0, 0, 0}};

  int result_code = s21_from_float_to_decimal(value, &result);

  ck_assert_int_eq(1, result_code);
  for (int i = 0; i < 4; i++) {
    ck_assert_int_eq(expected.bits[i], result.bits[i]);
  }
}
END_TEST

START_TEST(test_1) {
  float value = -8.66900895E-23;
  s21_decimal result = {0};
  s21_decimal expected = {{0xD3A55, 0x0, 0x0, 0x801C0000}};

  int result_code = s21_from_float_to_decimal(value, &result);

  ck_assert_int_eq(0, result_code);
  for (int i = 0; i < 4; i++) {
    ck_assert_int_eq(expected.bits[i], result.bits[i]);
  }
}
END_TEST

Suite *suite_float_to_decimal(void) {
  Suite *s = suite_create("suite_float_to_decimal");
  TCase *tc = tcase_create("tc_float_to_decimal");

  tcase_add_test(tc, test1);
  tcase_add_test(tc, test2);
  tcase_add_test(tc, test3);
  tcase_add_test(tc, test4);
  tcase_add_test(tc, test5);
  tcase_add_test(tc, test6);
  tcase_add_test(tc, test7);
  tcase_add_test(tc, test8);
  tcase_add_test(tc, test9);
  tcase_add_test(tc, test10);
  tcase_add_test(tc, test11);
  tcase_add_test(tc, test12);
  tcase_add_test(tc, test_0);
  tcase_add_test(tc, test_1);

  suite_add_tcase(s, tc);
  return s;
}
