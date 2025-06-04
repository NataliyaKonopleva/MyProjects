#include "../s21_tests.h"

START_TEST(rnd_test) {
  char str1[BUFF_SIZE] = {0};
  char str2[BUFF_SIZE] = {0};
  int j = 0;
  while (j < BUFF_SIZE) {
    str1[j] = rand() % 94 + 32;
    str2[j] = str1[j];
    j++;
  }
  str2[j] = str1[j] = '\0';
  int symbol = rand() % 94 + 32;
  s21_size_t n = rand() % BUFF_SIZE;
  _ck_assert_ptr(s21_memset(str1, symbol, n), ==, str1);
  memset(str2, symbol, n);
  ck_assert_str_eq(str1, str2);
}
END_TEST

Suite *suite_memset(void) {
  Suite *s = suite_create("suite_memset");
  TCase *tc = tcase_create("tc_memset");

  tcase_add_loop_test(tc, rnd_test, 0, amount_of_rand_tests);
  suite_add_tcase(s, tc);
  return s;
}
