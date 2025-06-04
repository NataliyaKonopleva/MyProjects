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
  CODEERROR = s21_mul(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(result.power, 0);
}
END_TEST

START_TEST(negative_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0;  // умножим на -0
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);
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
  val2.bits[0] = 5;  // умножим на 5
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 1);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(result.power, 0);
}
END_TEST

START_TEST(mul_zero) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;  // (максимум-1)/2
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b01111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 0;  // умножим на 5
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(result.power, 0);
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
  val2.bits[0] = 5;  // умножим на 5
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 2);
  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(result.power, 0);
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
  val2.bits[0] = 2;  // умножим на 2
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0],
                   0b11111111111111111111111111111110);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(result.power, 0);
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
  val2.bits[0] = 2;  // умножим на 2
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0],
                   0b11111111111111111111111111111110);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(result.power, 0);
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
  val2.bits[0] = 2;  // умножим на 2
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0],
                   0b11111111111111111111111111111110);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 1);
  ck_assert_int_eq(result.power, 0);
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
  val2.bits[0] = 2;  // умножим на 2
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 1;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);
  ck_assert_int_eq(CODEERROR, 0);
  ck_assert_int_eq(result.bits[0],
                   0b11111111111111111111111111111110);  // максимум -1
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.sign, 1);
  ck_assert_int_eq(result.power, 0);
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
  val2.bits[0] = 5;
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 1;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);

  ck_assert_int_eq(result.bits[0], 0);
  ck_assert_int_eq(result.bits[1], 0);
  ck_assert_int_eq(result.bits[2], 0);
  ck_assert_int_eq(result.power, 0);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(CODEERROR, 2);
}
END_TEST
//
START_TEST(too_big_result_test) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b11111111111111111111111111111111;
  val1.power = 28;
  val1.sign = 0;
  s21_decimal val2 = {0};
  val2.bits[0] = 1;  // по факту единица...
  val2.bits[1] = 0;
  val2.bits[2] = 0;
  val2.power = 0;
  val2.sign = 0;
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  CODEERROR = s21_mul(val1, val2, &result);

  ck_assert_int_eq(result.bits[0], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[1], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.bits[2], 0b11111111111111111111111111111111);
  ck_assert_int_eq(result.power, 28);
  ck_assert_int_eq(result.sign, 0);
  ck_assert_int_eq(CODEERROR, 0);
}
END_TEST

START_TEST(too_big_result_test2) {
  // s21_decimal val1 = {0};
  // val1.bits[0] = 894784853;
  // val1.bits[1] = -819591186;
  // val1.bits[2] = 1807003620;

  // s21_decimal val2 = {0};
  // val2.bits[0] = 153;  // по факту единица...
  // val2.bits[1] = 0;
  // val2.bits[2] = 0;
  // val2.bits[3] = 131072;
  // s21_decimal result = {0};

  // unsigned int CODEERROR = 0;
  // CODEERROR = s21_mul(val1, val2, &result);
  // ck_assert_int_eq(CODEERROR, 0);
  // ck_assert_int_eq(result.bits[0], 939524095);
  // ck_assert_int_eq(result.bits[1], -695628766);
  // ck_assert_int_eq(result.bits[2], -1530251757);
  // ck_assert_int_eq(result.power, 0);
  // ck_assert_int_eq(result.sign, 0);
}
END_TEST

START_TEST(positive_overload_circle) {
  s21_decimal val1 = {0};
  val1.bits[0] = 0b11111111111111111111111111111111;
  val1.bits[1] = 0b11111111111111111111111111111111;
  val1.bits[2] = 0b11111111111111111111111111111111;
  val1.power = 0;
  val1.sign = 0;
  s21_decimal val2 = {0};
  s21_decimal result = {0};

  unsigned int CODEERROR = 0;
  for (unsigned int i = 2; i < 5; i++) {
    val2.bits[0] = i;
    CODEERROR = s21_mul(val1, val2, &result);
    ck_assert_int_eq(CODEERROR, 1);
  }
}
END_TEST

Suite *suite_mul(void) {
  Suite *s = suite_create("suite_mul");
  TCase *tc = tcase_create("tc_mul");

  tcase_add_test(tc, positive_overload);
  tcase_add_test(tc, negative_overload);
  tcase_add_test(tc, bouth_positive);
  tcase_add_test(tc, bouth_negative);
  tcase_add_test(tc, negative_and_positive);
  tcase_add_test(tc, positive_and_negative);
  tcase_add_test(tc, too_small_value);
  tcase_add_test(tc, too_big_result_test);
  tcase_add_test(tc, too_big_result_test2);
  tcase_add_test(tc, positive_overload_circle);
  tcase_add_test(tc, mul_zero);
  tcase_add_test(tc, negative_zero);
  tcase_add_test(tc, calculation_error);

  suite_add_tcase(s, tc);
  return s;
}