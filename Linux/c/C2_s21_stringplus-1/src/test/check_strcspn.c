#include "../s21_tests.h"

START_TEST(Oleg_klm) {
  char str1[] = "HiOleg";
  char str2[] = "klm";

  ck_assert_int_eq(s21_strcspn(str1, str2), strcspn(str1, str2));
}
END_TEST

START_TEST(Oleg_empty) {
  char str1[] = "HiOleg";
  char str2[] = "";

  ck_assert_int_eq(s21_strcspn(str1, str2), strcspn(str1, str2));
}
END_TEST

START_TEST(Oleg_abcde) {
  char str1[] = "Hi, Oleg!";
  char str2[] = "abcde";

  ck_assert_int_eq(s21_strcspn(str1, str2), strcspn(str1, str2));
}
END_TEST

START_TEST(NoOleg_abcde) {
  char str1[] = "";
  char str2[] = "abcde";

  ck_assert_int_eq(s21_strcspn(str1, str2), strcspn(str1, str2));
}
END_TEST

Suite *suite_strcspn(void) {
  Suite *s = suite_create("suite_strcspn");
  TCase *tc = tcase_create("tc_strcspn");

  tcase_add_test(tc, Oleg_klm);
  tcase_add_test(tc, Oleg_empty);
  tcase_add_test(tc, Oleg_abcde);
  tcase_add_test(tc, NoOleg_abcde);

  suite_add_tcase(s, tc);
  return s;
}