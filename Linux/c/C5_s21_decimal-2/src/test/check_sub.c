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
  CODEERROR = s21_sub(val1, val2, NULL);
  ck_assert_int_eq(CODEERROR, 1);
}
END_TEST

START_TEST(negative_zero_minus_positive_zero) {
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
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(negative_zero_minus_negative_zero) {
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
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(positive_zero_minus_positive_zero) {
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
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
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
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
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
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
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
  val2.bits[0] = 0b11111111111111111111111111111111;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111110);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 1);
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
  val2.bits[0] = 0b11111111111111111111111111111111;
  val2.bits[1] = 0b11111111111111111111111111111111;
  val2.bits[2] = 0b11111111111111111111111111111111;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111110);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(negative_minus_positive) {
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
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(positive_minus_negative) {
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
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(negative_minus_positive_first_one_is_bigger_as_module) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111110;
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b11111111111111111111111111111111;
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
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(negative_minus_negative_second_one_is_bigger) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b11111111111111111111111111111111;
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
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111110);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 1);
}
END_TEST

START_TEST(positive_banking_round) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b11111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 15;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111110);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
}
END_TEST

START_TEST(negative_banking_round) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b11111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 16;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111101);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(sub_failed_test) {
  s21_decimal num_1 = {{1742750924, -765097718, 2020532269, 589824}};
  s21_decimal num_2 = {{-1135548987, -1729193528, 1968365552, -2147418112}};
  s21_decimal result = {0};
  s21_decimal expected = {{-1241024691, -847339254, 1968365572, 65536}};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(num_1, num_2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], expected.bits[0]);
  ck_assert_int_eq(result.bits[1], expected.bits[1]);
  ck_assert_int_eq(result.bits[2], expected.bits[2]);
  ck_assert_int_eq(result.sign, expected.sign);
}
END_TEST

START_TEST(equal_negative) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
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
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(equal_positive) {
  s21_decimal val1 = {0};
  val1.bits[0] = 1;
  val1.bits[1] = 0;
  val1.bits[2] = 0;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 1;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_sub(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
}
END_TEST

Suite *suite_sub(void) {
  Suite *s = suite_create("suite_sub");
  TCase *tc = tcase_create("tc_sub");

  tcase_add_test(tc, positive_overload);
  tcase_add_test(tc, negative_overload);
  tcase_add_test(tc, bouth_positive);
  tcase_add_test(tc, bouth_negative);
  tcase_add_test(tc, negative_minus_positive);
  tcase_add_test(tc, positive_minus_negative);
  tcase_add_test(tc, negative_minus_positive_first_one_is_bigger_as_module);
  tcase_add_test(tc, negative_minus_negative_second_one_is_bigger);
  tcase_add_test(tc, positive_banking_round);
  tcase_add_test(tc, negative_zero_minus_positive_zero);
  tcase_add_test(tc, calculation_error);
  tcase_add_test(tc, negative_banking_round);
  tcase_add_test(tc, sub_failed_test);
  tcase_add_test(tc, positive_zero_minus_positive_zero);
  tcase_add_test(tc, negative_zero_minus_negative_zero);
  tcase_add_test(tc, equal_positive);
  tcase_add_test(tc, equal_negative);

  suite_add_tcase(s, tc);
  return s;
}