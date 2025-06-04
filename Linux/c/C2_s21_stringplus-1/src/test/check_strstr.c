#include "../s21_tests.h"

START_TEST(strstr_basic_test) {
  char str1[] = "Hello, world!";
  char str2[] = "world";
  char *result = s21_strstr(str1, str2);
  char *expected = strstr(str1, str2);
  ck_assert_ptr_eq(expected, result);
}
END_TEST

START_TEST(strstr_empty_haystack_test) {
  char str1[] = "";
  char str2[] = "world";
  char *result = s21_strstr(str1, str2);
  char *expected = strstr(str1, str2);
  ck_assert_ptr_eq(expected, result);
}
END_TEST

START_TEST(strstr_empty_needle_test) {
  char str1[] = "Hello, world!";
  char str2[] = "";
  char *result = s21_strstr(str1, str2);
  char *expected = strstr(str1, str2);
  ck_assert_ptr_eq(expected, result);
}
END_TEST

START_TEST(strstr_substring_at_the_beginning_test) {
  char str1[] = "world, Hello!";
  char str2[] = "world";
  char *result = s21_strstr(str1, str2);
  char *expected = strstr(str1, str2);
  ck_assert_ptr_eq(expected, result);
}
END_TEST

START_TEST(strstr_substring_at_the_end_test) {
  char str1[] = "Hello, world!";
  char str2[] = "world!";
  char *result = s21_strstr(str1, str2);
  char *expected = strstr(str1, str2);
  ck_assert_ptr_eq(expected, result);
}
END_TEST

START_TEST(strstr_substring_not_found_test) {
  char str1[] = "Hello, world!";
  char str2[] = "sun";
  char *result = s21_strstr(str1, str2);
  char *expected = strstr(str1, str2);
  ck_assert_ptr_eq(expected, result);
}
END_TEST

Suite *suite_strstr(void) {
  Suite *s = suite_create("suite_strstr");
  TCase *tc = tcase_create("tc_strstr");

  tcase_add_test(tc, strstr_basic_test);
  tcase_add_test(tc, strstr_empty_haystack_test);
  // tcase_add_test(tc, strstr_null_pointer_test);
  tcase_add_test(tc, strstr_substring_at_the_beginning_test);
  tcase_add_test(tc, strstr_substring_at_the_end_test);
  tcase_add_test(tc, strstr_substring_not_found_test);
  tcase_add_test(tc, strstr_empty_needle_test);

  suite_add_tcase(s, tc);
  return s;
}