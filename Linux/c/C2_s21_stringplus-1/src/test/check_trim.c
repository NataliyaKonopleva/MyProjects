#include "../s21_tests.h"

START_TEST(basic_test) {
  char src[] = "isthisrealytestlinethisis";
  char trim_chars[] = "this";
  char expct_string[] = "realytestline";
  char *string = s21_trim(src, trim_chars);
  ck_assert_str_eq(string, expct_string);
  free(string);
  string = NULL;
}
END_TEST

START_TEST(no_trim_chars) {
  char src[] = "  isthisthisis   ";
  char trim_chars[] = "";
  char expct_string[] = "isthisthisis";
  char *string = s21_trim(src, trim_chars);
  ck_assert_str_eq(string, expct_string);
  free(string);
  string = NULL;
}
END_TEST

START_TEST(NULL_ptr_as_trim_chars) {
  char src[] = "isthisthisis";
  char *string = s21_trim(src, s21_NULL);
  ck_assert_ptr_null(string);
}
END_TEST

START_TEST(NULL_ptr_as_src) {
  char trim_chars[] = "isthisthisis";
  char *string = s21_trim(s21_NULL, trim_chars);
  ck_assert_ptr_null(string);
}
END_TEST

START_TEST(empty_src_string) {
  char src[] = "";
  char trim_chars[] = "sdf";
  char expct_string[] = "";
  char *string = s21_trim(src, trim_chars);
  ck_assert_str_eq(string, expct_string);
  free(string);
  string = NULL;
}
END_TEST

START_TEST(all_empty) {
  char src[] = "";
  char trim_chars[] = "";
  char expct_string[] = "";
  char *string = s21_trim(src, trim_chars);
  ck_assert_str_eq(string, expct_string);
  free(string);
  string = NULL;
}
END_TEST

START_TEST(existential_crisis) {
  char src[] = "!$# What is the purpose of life?@!#";
  char trim_chars[] = "!$# @!#";
  char expct_string[] = "What is the purpose of life?";
  char *string = s21_trim(src, trim_chars);
  ck_assert_str_eq(string, expct_string);
  free(string);
  string = NULL;
}
END_TEST

Suite *suite_trim(void) {
  Suite *s = suite_create("suite_trim");
  TCase *tc = tcase_create("tc_trim");

  tcase_add_test(tc, basic_test);
  tcase_add_test(tc, no_trim_chars);
  tcase_add_test(tc, NULL_ptr_as_trim_chars);
  tcase_add_test(tc, empty_src_string);
  tcase_add_test(tc, all_empty);
  tcase_add_test(tc, existential_crisis);
  tcase_add_test(tc, NULL_ptr_as_src);
  suite_add_tcase(s, tc);
  return s;
}