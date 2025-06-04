#include "../s21_tests.h"

START_TEST(s21_void_string) {
  // Тест 1: Пустая строка
  char str1[] = "";
  char c1 = 'a';
  char *result = s21_strrchr(str1, c1);
  char *expected = strrchr(str1, c1);
  ck_assert_ptr_eq(result, expected);
}
END_TEST
START_TEST(s21_first_c) {
  // Тест 2: Символ в начале строки
  char str1[] = "abcdef";
  char c1 = 'a';
  char *result = s21_strrchr(str1, c1);
  char *expected = strrchr(str1, c1);
  ck_assert_ptr_eq(result, expected);
}
END_TEST

START_TEST(s21_last_c) {
  // Тест 3: Символ в конце строки
  char str1[] = "abcdef";
  char c1 = 'f';
  char *result = s21_strrchr(str1, c1);
  char *expected = strrchr(str1, c1);
  ck_assert_ptr_eq(result, expected);
}
END_TEST

START_TEST(s21_middle_string) {
  // Тест 4: Символ в середине строки
  char str1[] = "abcdef";
  char c1 = 'c';
  char *result = s21_strrchr(str1, c1);
  char *expected = strrchr(str1, c1);
  ck_assert_ptr_eq(result, expected);
}
END_TEST

START_TEST(s21_string_non) {
  // Тест 5: Символ отсутствует в строке
  char str1[] = "abcdef";
  char c1 = 'g';
  char *result = s21_strrchr(str1, c1);
  char *expected = strrchr(str1, c1);
  ck_assert_ptr_eq(result, expected);
}
END_TEST

START_TEST(s21_string_null_last) {
  // Тест 6: Символ - это нулевой символ в конце строки
  char str1[] = "abcdef";
  char c1 = '\0';
  char *result = s21_strrchr(str1, c1);
  char *expected = strrchr(str1, c1);
  ck_assert_ptr_eq(result, expected);
}
END_TEST

START_TEST(s21_string_null_mid) {
  // Тест 7: Символ - это нулевой символ в середине строки
  char str1[] = "abc\0def";
  char c1 = '\0';
  char *result = s21_strrchr(str1, c1);
  char *expected = strrchr(str1, c1);
  ck_assert_ptr_eq(result, expected);
}
END_TEST

START_TEST(s21_null_null) {
  // Тест 8: Символ - это отсутствующий символ в строке
  char str1[] = "abcde";
  char c1 = ' ';
  char *result = s21_strrchr(str1, c1);
  char *expected = strrchr(str1, c1);
  ck_assert_ptr_eq(result, expected);
}
END_TEST

Suite *suite_strrchr(void) {
  Suite *s = suite_create("suite_strrchr");
  TCase *tc = tcase_create("tc_strrchr");

  tcase_add_test(tc, s21_void_string);
  tcase_add_test(tc, s21_first_c);
  tcase_add_test(tc, s21_last_c);
  tcase_add_test(tc, s21_middle_string);
  tcase_add_test(tc, s21_string_non);
  tcase_add_test(tc, s21_string_null_last);
  tcase_add_test(tc, s21_string_null_mid);
  tcase_add_test(tc, s21_null_null);

  suite_add_tcase(s, tc);
  return s;
}