#include "../s21_tests.h"

void test_equal_s(const char *str1, const char *str2, s21_size_t n) {
  int r21 = s21_strncmp(str1, str2, n);
  int r = strncmp(str1, str2, n);
  if (r21 > 1) r21 = 1;
  if (r > 1) r = 1;
  if (r21 < -1) r21 = -1;
  if (r < -1) r = -1;
  ck_assert_int_eq(r21, r);
}

START_TEST(str_equal) {
  char str1[] = "abcde";
  char str2[] = "abcde";
  int n = 5;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(str_zero) {
  char str1[] = "abcde";
  char str2[] = "abcde";
  int n = 0;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(str_register) {
  char str1[] = "abCde";
  char str2[] = "abcde";
  int n = 5;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(str_zero_num) {
  char str1[] = "1234567";
  char str2[] = "123456";
  int n = 0;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(str_num_diff) {
  char str1[] = "123456789";
  char str2[] = "12345678";
  int n = 9;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(str_num_eq) {
  char str1[] = "123456789";
  char str2[] = "12345678";
  int n = 8;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(str_num_1) {
  char str1[] = "13";
  char str2[] = "1234";
  int n = 2;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(str_num_2) {
  char str1[] = "134567";
  char str2[] = "1234";
  int n = 2;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(long_str_eq1) {
  char str1[] =
      "010101010101010101012312312312312312434524563567adsfe Knata stalwaraASD";
  char str2[] =
      "010101010101010101012312312312312312434524563567adsfe Knata stalwaraASD";
  int n = 71;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(long_str_not_eq1) {
  char str1[] =
      "010101010101010101012312312312312312434524563567adsfe Knata stalwaraASD";
  char str2[] =
      "010101010101010101012312312312312312434524563567adsfe Knata stalwaraASd";
  int n = 71;
  test_equal_s(str1, str2, n);
}
END_TEST

START_TEST(str_num_3) {
  char str1[] = "134567";
  char str2[] = "134567";
  int n = 7;
  test_equal_s(str1, str2, n);
}
END_TEST

Suite *suite_strncmp(void) {
  Suite *s = suite_create("suite_strncmp");
  TCase *tc = tcase_create("tc_strncmp");

  tcase_add_test(tc, str_equal);
  tcase_add_test(tc, str_zero);
  tcase_add_test(tc, str_register);
  tcase_add_test(tc, str_zero_num);
  tcase_add_test(tc, str_num_diff);
  tcase_add_test(tc, str_num_eq);
  tcase_add_test(tc, str_num_1);
  tcase_add_test(tc, str_num_2);
  tcase_add_test(tc, str_num_3);
  tcase_add_test(tc, long_str_eq1);
  tcase_add_test(tc, long_str_not_eq1);

  suite_add_tcase(s, tc);
  return s;
}