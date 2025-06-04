#include "../s21_tests.h"

START_TEST(check_strpbrk) {
  ck_assert_int_eq(strcmp(s21_strpbrk("this is", "s"), strpbrk("this is", "s")),
                   0);
  ck_assert_int_eq(
      strcmp(s21_strpbrk("this is", "th"), strpbrk("this is", "th")), 0);
  ck_assert_int_eq(
      strcmp(s21_strpbrk("this is", "hi"), strpbrk("this is", "hi")), 0);
  ck_assert_msg(s21_strpbrk("this is", "") == strpbrk("this is", ""),
                "FAILURE! Test");
  ck_assert_msg(s21_strpbrk("this is", "dplf") == strpbrk("this is", "dplf"),
                "Fail");
}
END_TEST

Suite *suite_strpbrk(void) {
  Suite *s = suite_create("suite_strpbrk");
  TCase *tc = tcase_create("tc_strpbrk");
  tcase_add_test(tc, check_strpbrk);
  suite_add_tcase(s, tc);
  return s;
}