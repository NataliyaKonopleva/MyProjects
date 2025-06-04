#include "../s21_tests.h"

START_TEST(to_upper_test1) {
  char str[] = "hello world!";
  char expect[] = "HELLO WORLD!";
  char *rez = s21_to_upper(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(to_upper_test2) {
  char str[] = "Hello World?";
  char expect[] = "HELLO WORLD?";
  char *rez = s21_to_upper(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(to_upper_test3) {
  char str[] = "19+02*1972 nata";
  char expect[] = "19+02*1972 NATA";
  char *rez = s21_to_upper(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(to_upper_test4) {
  char str[] = " ";
  char expect[] = " ";
  char *rez = s21_to_upper(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(to_upper_test5) {
  char str[] = "";
  char expect[] = "";
  char *rez = s21_to_upper(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

Suite *suite_to_upper(void) {
  Suite *s = suite_create("suite_to_upper");
  TCase *tc = tcase_create("to_upper_tc");

  tcase_add_test(tc, to_upper_test1);
  tcase_add_test(tc, to_upper_test2);
  tcase_add_test(tc, to_upper_test3);
  tcase_add_test(tc, to_upper_test4);
  tcase_add_test(tc, to_upper_test5);

  suite_add_tcase(s, tc);
  return s;
}