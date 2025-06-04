#include "../s21_tests.h"

START_TEST(test_abc) {
  ck_assert_msg(s21_strlen("") == strlen(""), "FAILURE! Tes \"\" failed!");
  ck_assert_msg(s21_strlen("abc") == strlen("abc"),
                "FAILURE! Test \"abc\" failed!");
  ck_assert_msg(s21_strlen("123 ") == strlen("123 "),
                "FAILURE! Test \"123 \" failed!");
  ck_assert_msg(s21_strlen("l") == strlen("l"), "FAILURE! Test \"l\" failed!");
}
END_TEST

Suite *suite_strlen(void) {
  Suite *s = suite_create("suite_strlen");
  TCase *tc = tcase_create("tc_strlen");
  tcase_add_test(tc, test_abc);
  suite_add_tcase(s, tc);
  return s;
}