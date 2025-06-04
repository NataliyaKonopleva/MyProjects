#include "../s21_tests.h"

START_TEST(to_lower_test1) {
  char str[] = "HELLO WORLD!";
  char expect[] = "hello world!";
  char *rez = s21_to_lower(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(to_lower_test2) {
  char str[] = "Hello World?";
  char expect[] = "hello world?";
  char *rez = s21_to_lower(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(to_lower_test3) {
  char str[] = "19+02*1972 NATA";
  char expect[] = "19+02*1972 nata";
  char *rez = s21_to_lower(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(to_lower_test4) {
  char str[] = " ";
  char expect[] = " ";
  char *rez = s21_to_lower(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(to_lower_test5) {
  char str[] = "";
  char expect[] = "";
  char *rez = s21_to_lower(str);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

Suite *suite_to_lower(void) {
  Suite *s = suite_create("suite_to_lower");
  TCase *tc = tcase_create("to_lower_tc");

  tcase_add_test(tc, to_lower_test1);
  tcase_add_test(tc, to_lower_test2);
  tcase_add_test(tc, to_lower_test3);
  tcase_add_test(tc, to_lower_test4);
  tcase_add_test(tc, to_lower_test5);

  suite_add_tcase(s, tc);
  return s;
}