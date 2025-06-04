#include "../s21_tests.h"

START_TEST(empty_all) {
  char str1[] = "";
  char str2[] = "";
  s21_size_t n = 0;
  ck_assert_str_eq(s21_strncat(str1, str2, n), strncat(str1, str2, n));
}
END_TEST

START_TEST(norm_all) {
  char str1[30] = "ya";
  char str2[30] = "Hello ";
  s21_size_t n = 5;
  ck_assert_str_eq(s21_strncat(str1, str2, n), strncat(str1, str2, n));
}
END_TEST

Suite *suite_strncat(void) {
  Suite *s = suite_create("suite_strncat");
  TCase *tc = tcase_create("tc_strncat");

  tcase_add_test(tc, empty_all);
  tcase_add_test(tc, norm_all);

  suite_add_tcase(s, tc);
  return s;
}