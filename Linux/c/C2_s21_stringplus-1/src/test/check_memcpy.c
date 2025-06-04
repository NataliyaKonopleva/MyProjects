#include "../s21_tests.h"

START_TEST(rnd_test) {
  char str1[BUFF_SIZE] = {0};
  char str2[BUFF_SIZE] = {0};
  char stringtocopy[BUFF_SIZE] = {0};
  int j = 0;
  while (j < BUFF_SIZE) {
    str1[j] = rand() % 94 + 32;
    str2[j] = str1[j];
    j++;
  }
  str2[j] = str1[j] = '\0';
  s21_size_t n = rand() % (BUFF_SIZE - 1);

  for (int i = 0; i < (int)n; i++) {
    stringtocopy[i] = rand() % 94 + 32;
  }

  _ck_assert_ptr(s21_memcpy(str1, stringtocopy, n), ==, str1);
  memcpy(str2, stringtocopy, n);
  ck_assert_str_eq(str1, str2);
}
END_TEST

Suite *suite_memcpy(void) {
  Suite *s = suite_create("suite_memcpy");
  TCase *tc = tcase_create("tc_memcpy");

  tcase_add_loop_test(tc, rnd_test, 0, amount_of_rand_tests);
  suite_add_tcase(s, tc);
  return s;
}
