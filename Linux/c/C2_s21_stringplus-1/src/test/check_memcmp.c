#include "../s21_tests.h"

void test_equal(const char *str1, const char *str2, s21_size_t n) {
  int r21 = s21_memcmp(str1, str2, n);
  int r = memcmp(str1, str2, n);
  ck_assert_int_eq(r21, r);
}

START_TEST(byte_equal) {
  char str1[] = "abcde";
  char str2[] = "abcde";
  int n = 5;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(byte_zero) {
  char str1[] = "abcde";
  char str2[] = "abcde";
  int n = 0;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(register_test) {
  char str1[] = "abCde";
  char str2[] = "abcde";
  int n = 5;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(byte_zero_num) {
  char str1[] = "1234567";
  char str2[] = "123456";
  int n = 0;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(byte_num_diff) {
  char str1[] = "123456789";
  char str2[] = "12345678";
  int n = 9;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(byte_num_eq) {
  char str1[] = "123456789";
  char str2[] = "12345678";
  int n = 8;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(byte_num_1) {
  char str1[] = "13";
  char str2[] = "1234";
  int n = 2;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(byte_num_2) {
  char str1[] = "134567";
  char str2[] = "1234";
  int n = 2;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(long_str_eq) {
  char str1[] =
      "010101010101010101012312312312312312434524563567adsfe Knata stalwaraASD";
  char str2[] =
      "010101010101010101012312312312312312434524563567adsfe Knata stalwaraASD";
  int n = 71;
  test_equal(str1, str2, n);
}
END_TEST

START_TEST(long_str_not_eq) {
  char str1[] =
      "010101010101010101012312312312312312434524563567adsfe Knata stalwaraASD";
  char str2[] =
      "010101010101010101012312312312312312434524563567adsfe Knata stalwaraASd";
  int n = 71;
  test_equal(str1, str2, n);
}
END_TEST

Suite *suite_memcmp(void) {
  Suite *s = suite_create("suite_memcmp");
  TCase *tc = tcase_create("tc_memcmp");

  tcase_add_test(tc, byte_equal);
  tcase_add_test(tc, byte_zero);
  tcase_add_test(tc, register_test);
  tcase_add_test(tc, byte_zero_num);
  tcase_add_test(tc, byte_num_diff);
  tcase_add_test(tc, byte_num_eq);
  tcase_add_test(tc, byte_num_1);
  tcase_add_test(tc, byte_num_2);
  tcase_add_test(tc, long_str_eq);
  tcase_add_test(tc, long_str_not_eq);

  suite_add_tcase(s, tc);
  return s;
}