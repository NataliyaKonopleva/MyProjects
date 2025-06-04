#include "../s21_tests.h"

START_TEST(rnd_test) {
  unsigned char str1[BUFF_SIZE] = {0};
  int j = 0;
  while (j < BUFF_SIZE) {
    str1[j] = rand() % 94 + 32;
    j++;
  }
  str1[j] = '\0';
  int symbol = rand() % 94 + 32;
  s21_size_t n = rand() % (BUFF_SIZE - 1);
  _ck_assert_ptr(s21_memchr(str1, symbol, n), ==, memchr(str1, symbol, n));
}
END_TEST

Suite *suite_memchr(void) {
  Suite *s = suite_create("suite_memchr");
  TCase *tc = tcase_create("tc_memchr");

  tcase_add_loop_test(tc, rnd_test, 0, amount_of_rand_tests);
  suite_add_tcase(s, tc);
  return s;
}
