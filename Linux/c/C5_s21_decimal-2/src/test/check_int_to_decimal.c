#include "../s21_tests.h"

void test_from_int_to_decimal(int number, s21_decimal decimal_check) {
  s21_decimal result;
  int code = s21_from_int_to_decimal(number, &result);
  ck_assert_int_eq(code, OK);
  ck_assert_int_eq(s21_is_equal(result, decimal_check), 1);
  ck_assert_int_eq(decimal_check.sign, result.sign);
}

START_TEST(test1) {
  s21_decimal temp;
  int src = 123456789;
  int expect = 123456789;
  int res = s21_from_int_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, expect);
}
END_TEST

START_TEST(test2) {
  s21_decimal temp;
  int src = -123456789;
  int expect = -123456789;
  int res = s21_from_int_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, expect);
}
END_TEST

START_TEST(test3) {
  s21_decimal temp;
  int src = 0;
  int expect = 0;
  int res = s21_from_int_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, expect);
}
END_TEST

START_TEST(test4) {
  s21_decimal temp;
  int src = -2147483648;
  int expect = -2147483648;
  int res = s21_from_int_to_decimal(src, &temp);
  int exp_res = 0;
  ck_assert_int_eq(res, exp_res);
  int result = (temp.sign == 0) ? temp.bits[0] : -temp.bits[0];
  ck_assert_int_eq(result, expect);
}
END_TEST

START_TEST(test_from_int_to_decimal_fail1) {
  int number = -2147483648;
  int result = s21_from_int_to_decimal(number, NULL);

  ck_assert_int_eq(result, CONVERTATION_ERROR);
}
END_TEST

START_TEST(test_from_int_to_decimal_ok1) {
  int number = -2147483648;
  // Converted the Int32 value -2147483648 to the Decimal value -2147483648.
  s21_decimal decimal_check = {{0x80000000, 0x0, 0x0, 0x80000000}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok2) {
  int number = -2147483647;
  // Converted the Int32 value -2147483647 to the Decimal value -2147483647.
  s21_decimal decimal_check = {{0x7FFFFFFF, 0x0, 0x0, 0x80000000}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok3) {
  int number = -214748364;
  // Converted the Int32 value -214748364 to the Decimal value -214748364.
  s21_decimal decimal_check = {{0xCCCCCCC, 0x0, 0x0, 0x80000000}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok4) {
  int number = -214748;
  // Converted the Int32 value -214748 to the Decimal value -214748.
  s21_decimal decimal_check = {{0x346DC, 0x0, 0x0, 0x80000000}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok5) {
  int number = -1000;
  // Converted the Int32 value -1000 to the Decimal value -1000.
  s21_decimal decimal_check = {{0x3E8, 0x0, 0x0, 0x80000000}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok6) {
  int number = -1;
  // Converted the Int32 value -1 to the Decimal value -1.
  s21_decimal decimal_check = {{0x1, 0x0, 0x0, 0x80000000}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok7) {
  int number = 0;
  // Converted the Int32 value 0 to the Decimal value 0.
  s21_decimal decimal_check = {{0x0, 0x0, 0x0, 0x0}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok8) {
  int number = 1;
  // Converted the Int32 value 1 to the Decimal value 1.
  s21_decimal decimal_check = {{0x1, 0x0, 0x0, 0x0}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok9) {
  int number = 1000;
  // Converted the Int32 value 1000 to the Decimal value 1000.
  s21_decimal decimal_check = {{0x3E8, 0x0, 0x0, 0x0}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok10) {
  int number = 214748;
  // Converted the Int32 value 214748 to the Decimal value 214748.
  s21_decimal decimal_check = {{0x346DC, 0x0, 0x0, 0x0}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok11) {
  int number = 214748364;
  // Converted the Int32 value 214748364 to the Decimal value 214748364.
  s21_decimal decimal_check = {{0xCCCCCCC, 0x0, 0x0, 0x0}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok12) {
  int number = 2147483646;
  // Converted the Int32 value 2147483646 to the Decimal value 2147483646.
  s21_decimal decimal_check = {{0x7FFFFFFE, 0x0, 0x0, 0x0}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_from_int_to_decimal_ok13) {
  int number = 2147483647;
  // Converted the Int32 value 2147483647 to the Decimal value 2147483647.
  s21_decimal decimal_check = {{0x7FFFFFFF, 0x0, 0x0, 0x0}};

  test_from_int_to_decimal(number, decimal_check);
}

START_TEST(test_0) {
  s21_decimal decimal = {0};
  int result = s21_from_int_to_decimal(0, &decimal);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(0, decimal.sign);
  ck_assert_int_eq(0, decimal.bits[0]);
}
END_TEST

START_TEST(test_1) {
  s21_decimal decimal = {0};
  int result = s21_from_int_to_decimal(3, &decimal);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(0, decimal.sign);
  ck_assert_int_eq(3, decimal.bits[0]);
}
END_TEST

START_TEST(test_2) {
  s21_decimal decimal = {0};
  int result = s21_from_int_to_decimal(2147483647, &decimal);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(0, decimal.sign);
  ck_assert_int_eq(2147483647, decimal.bits[0]);
}
END_TEST

START_TEST(test_3) {
  s21_decimal decimal = {0};
  int result = s21_from_int_to_decimal(-1, &decimal);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(1, decimal.bits[0]);  // 1, 0, 0, -2147483648
  ck_assert_int_eq(0, decimal.bits[1]);
  ck_assert_int_eq(0, decimal.bits[2]);
  ck_assert_int_eq(2147483648, decimal.bits[3]);
}
END_TEST

START_TEST(test_4) {
  s21_decimal decimal = {0};
  int result = s21_from_int_to_decimal(-123, &decimal);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(1, decimal.sign);
  ck_assert_int_eq(123, decimal.bits[0]);
}
END_TEST

START_TEST(test_5) {
  s21_decimal decimal = {0};
  int result = s21_from_int_to_decimal(-2147483648, &decimal);

  ck_assert_int_eq(0, result);
  ck_assert_int_eq(1, decimal.sign);
  ck_assert_int_eq(2147483648, decimal.bits[0]);
  ck_assert_int_eq(0, decimal.bits[1]);
  ck_assert_int_eq(0, decimal.bits[2]);
}
END_TEST

START_TEST(s21_from_int_to_decimal_1) {
  s21_decimal val;

  s21_from_int_to_decimal(0, &val);
  ck_assert_int_eq(val.bits[0], 0);
  ck_assert_int_eq(val.bits[1], 0);
  ck_assert_int_eq(val.bits[2], 0);
  ck_assert_int_eq(val.bits[3], 0);

  s21_from_int_to_decimal(-128, &val);
  ck_assert_int_eq(val.bits[0], 128);
  ck_assert_int_eq(val.bits[1], 0);
  ck_assert_int_eq(val.bits[2], 0);
  ck_assert_int_eq(val.bits[3], 2147483648);

  s21_from_int_to_decimal(127, &val);
  ck_assert_int_eq(val.bits[0], 127);
  ck_assert_int_eq(val.bits[1], 0);
  ck_assert_int_eq(val.bits[2], 0);
  ck_assert_int_eq(val.bits[3], 0);

  s21_from_int_to_decimal(-2147483648, &val);
  ck_assert_int_eq(val.bits[0], 2147483648);
  ck_assert_int_eq(val.bits[1], 0);
  ck_assert_int_eq(val.bits[2], 0);
  ck_assert_int_eq(val.bits[3], 2147483648);

  s21_from_int_to_decimal(2147483647, &val);
  ck_assert_int_eq(val.bits[0], 2147483647);
  ck_assert_int_eq(val.bits[1], 0);
  ck_assert_int_eq(val.bits[2], 0);
  ck_assert_int_eq(val.bits[3], 0);
}
END_TEST

Suite *suite_int_to_decimal(void) {
  Suite *s = suite_create("suite_int_to_decimal");
  TCase *tc = tcase_create("tc_int_to_decimal");

  tcase_add_test(tc, test1);
  tcase_add_test(tc, test2);
  tcase_add_test(tc, test3);
  tcase_add_test(tc, test4);
  tcase_add_test(tc, test_from_int_to_decimal_fail1);

  tcase_add_test(tc, test_from_int_to_decimal_ok1);
  tcase_add_test(tc, test_from_int_to_decimal_ok2);
  tcase_add_test(tc, test_from_int_to_decimal_ok3);
  tcase_add_test(tc, test_from_int_to_decimal_ok4);
  tcase_add_test(tc, test_from_int_to_decimal_ok5);
  tcase_add_test(tc, test_from_int_to_decimal_ok6);
  tcase_add_test(tc, test_from_int_to_decimal_ok7);
  tcase_add_test(tc, test_from_int_to_decimal_ok8);
  tcase_add_test(tc, test_from_int_to_decimal_ok9);
  tcase_add_test(tc, test_from_int_to_decimal_ok10);
  tcase_add_test(tc, test_from_int_to_decimal_ok11);
  tcase_add_test(tc, test_from_int_to_decimal_ok12);
  tcase_add_test(tc, test_from_int_to_decimal_ok13);
  tcase_add_test(tc, test_0);
  tcase_add_test(tc, test_1);
  tcase_add_test(tc, test_2);
  tcase_add_test(tc, test_3);
  tcase_add_test(tc, test_4);
  tcase_add_test(tc, test_5);
  tcase_add_test(tc, s21_from_int_to_decimal_1);

  suite_add_tcase(s, tc);
  return s;
}