#include "../s21_tests.h"

START_TEST(Err_Not_a_directory) {
  char *str1 = s21_strerror(20);
  char *str2 = strerror(20);

  ck_assert_str_eq(str1, str2);
}
END_TEST

START_TEST(Err_Cannot_allocate_memory) {
  char *str3 = s21_strerror(12);
  char *str4 = strerror(12);

  ck_assert_str_eq(str3, str4);
}
END_TEST

START_TEST(Err_Unknown_error) {
  char *str5 = s21_strerror(1134);
  char *str6 = strerror(1134);

  ck_assert_str_eq(str5, str6);
}
END_TEST

START_TEST(Err_Operation_not_permitted) {
  char *str7 = s21_strerror(1);
  char *str8 = strerror(1);

  ck_assert_str_eq(str7, str8);
}
END_TEST

START_TEST(Err_Inappropriate_ioctl_for_device) {
  char *str9 = s21_strerror(25);
  char *str0 = strerror(25);

  ck_assert_str_eq(str9, str0);
}
END_TEST

START_TEST(Err_seg) {
  char *str11 = s21_strerror(28);
  char *str12 = strerror(28);

  ck_assert_str_eq(str11, str12);
}
END_TEST

START_TEST(Err_minus) {
  char *str13 = s21_strerror(-1);
  char *str14 = strerror(-1);

  ck_assert_str_eq(str13, str14);
}
END_TEST

Suite *suite_strerror(void) {
  Suite *s = suite_create("suite_strerror");
  TCase *tc = tcase_create("tc_strerror");

  tcase_add_test(tc, Err_Not_a_directory);
  tcase_add_test(tc, Err_Cannot_allocate_memory);
  tcase_add_test(tc, Err_Unknown_error);
  tcase_add_test(tc, Err_Operation_not_permitted);
  tcase_add_test(tc, Err_Inappropriate_ioctl_for_device);
  tcase_add_test(tc, Err_seg);
  tcase_add_test(tc, Err_minus);

  suite_add_tcase(s, tc);
  return s;
}