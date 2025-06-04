#include "../s21_tests.h"

START_TEST(insert_test1) {
  char str[] = "London";
  char src[] = "I live in . London, Good morning!";
  s21_size_t index = 10;
  char expect[] = "I live in London. London, Good morning!";
  char *rez = (char *)s21_insert(src, str, index);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(insert_test2) {
  char str[] = "Hello, ";
  char src[] = "World!";
  s21_size_t index = 0;
  char expect[] = "Hello, World!";
  char *rez = (char *)s21_insert(src, str, index);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(insert_test3) {
  char str[] = "";
  char src[] = "";
  s21_size_t index = 0;
  char *expect = "";
  char *rez = (char *)s21_insert(src, str, index);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(insert_test4) {
  char *src = NULL;
  char *str = NULL;
  s21_size_t index = 100;
  char *rez = s21_insert(src, str, index);
  ck_assert_ptr_null(rez);
  if (rez) free(rez);
}
END_TEST

START_TEST(insert_test5) {
  char str[] = "school_21 ";
  char src[] = "Student of ";
  s21_size_t index = 11;
  char expect[] = "Student of school_21 ";
  char *rez = (char *)s21_insert(src, str, index);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

START_TEST(insert_test6) {
  char str[] = "Hello ";
  char src[] = "world!";
  s21_size_t index = 0;
  char *expect = "Hello world!";
  char *rez = (char *)s21_insert(src, str, index);
  ck_assert_str_eq(rez, expect);
  if (rez) free(rez);
}
END_TEST

Suite *suite_insert(void) {
  Suite *s = suite_create("suite_insert");
  TCase *tc = tcase_create("insert_tc");

  tcase_add_test(tc, insert_test1);
  tcase_add_test(tc, insert_test2);
  tcase_add_test(tc, insert_test3);
  tcase_add_test(tc, insert_test4);
  tcase_add_test(tc, insert_test5);
  tcase_add_test(tc, insert_test6);

  suite_add_tcase(s, tc);
  return s;
}